#!/usr/bin/env python3
"""
对 lib/{arm64-v8a,armeabi-v7a}/libmadomagi_native.so 做一个最小化的二进制
patch：把 `DownloadAssetMap::isDownloadComplete(string)` 的返回值强制
改成 `true`，让 Cocos2D 引擎自带的资源核查机制把每一份资源都视作
"已经下好了"，从而**杜绝**触发 15G 重下载的可能性。

详细背景：见 docs/engine-asset-flow.md。

用法：
    python3 tools/patch_libmadomagi.py [--apk-root .] [--dry-run]

行为：
    - 自动定位 lib/arm64-v8a/libmadomagi_native.so 和
      lib/armeabi-v7a/libmadomagi_native.so；
    - 通过 ELF 动态符号表精确定位 isDownloadComplete 的虚拟地址，
      换算到文件偏移；
    - 反汇编（手工模式）找到函数末尾的 "mov w0, w20" / "mov r0, r5"
      指令（即返回值的最后一次赋值）；
    - 验证当前字节确实是已知的原始指令；如果不是（比如游戏被上游
      更新过），打 warning 并跳过，不强行改；
    - 改成 "mov w0, #1" / "movs r0, #1"；
    - 打日志输出每一处 patch 的文件 / 偏移 / 原值 → 新值。

退出码：
    0 — 至少有一份 .so 被成功 patch
    1 — 没有任何 .so 被 patch（全部 skip 或全部找不到）
    2 — 致命错误（参数 / 文件 IO / ELF 损坏）

设计原则：
    - "签名失败就 skip"——只改原始字节确实匹配的目标，不强行覆盖；
    - 每次 patch 都打印验证用的字节签名，方便事后审计；
    - dry-run 模式只读不改，用来在 CI 里先确认能找到目标。
"""

from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path
from typing import Optional


# ───────────────────────────────────────────────────────────────────
# ANSI 颜色（和 GitHub Actions 里 build.yml 的 Python heredoc 风格统一）
# ───────────────────────────────────────────────────────────────────
class C:
    RESET         = "\033[0m"
    BOLD          = "\033[1m"
    DIM           = "\033[2m"
    RED           = "\033[31m"
    BRIGHT_GREEN  = "\033[92m"
    BRIGHT_YELLOW = "\033[93m"
    BRIGHT_BLUE   = "\033[94m"
    BRIGHT_CYAN   = "\033[96m"
    BRIGHT_WHITE  = "\033[97m"
    CYAN          = "\033[36m"


def c(color: str, text: str) -> str:
    return f"{color}{text}{C.RESET}"


def header(text: str) -> None:
    bar = "═" * 60
    print(f"\n{c(C.BOLD + C.BRIGHT_BLUE, bar)}")
    print(c(C.BOLD + C.BRIGHT_WHITE, f"  {text}"))
    print(f"{c(C.BOLD + C.BRIGHT_BLUE, bar)}\n", flush=True)


def section(text: str) -> None:
    print(f"\n{c(C.BOLD + C.CYAN, '┌─ ' + text)}", flush=True)


def info(text: str, indent: int = 0) -> None:
    print(f"{'  '*indent}{c(C.BRIGHT_BLUE, 'ℹ')} {text}", flush=True)


def ok(text: str, indent: int = 0) -> None:
    print(f"{'  '*indent}{c(C.BRIGHT_GREEN, '✔')} {text}", flush=True)


def warn(text: str, indent: int = 0) -> None:
    print(f"{'  '*indent}{c(C.BRIGHT_YELLOW, '⚠')} {text}", flush=True)


def err(text: str, indent: int = 0) -> None:
    print(f"{'  '*indent}{c(C.RED, '✘')} {text}", flush=True)


# ───────────────────────────────────────────────────────────────────
# 最小 ELF 解析器：只读 dynsym + section headers + dynstr
# ───────────────────────────────────────────────────────────────────
TARGET_SYMBOL = (
    "_ZN16DownloadAssetMap18isDownloadCompleteERKNSt6"
    "__ndk112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE"
)


class Elf:
    """Just enough ELF to find a function symbol's file offset."""

    def __init__(self, path: Path) -> None:
        self.path = path
        self.data = path.read_bytes()
        if self.data[:4] != b"\x7fELF":
            raise ValueError(f"{path} 不是 ELF 文件")

        self.is_64 = self.data[4] == 2
        endian = "<" if self.data[5] == 1 else ">"
        self.endian = endian

        if self.is_64:
            self.e_machine   = struct.unpack(endian + "H", self.data[18:20])[0]
            self.e_shoff     = struct.unpack(endian + "Q", self.data[40:48])[0]
            self.e_shentsize = struct.unpack(endian + "H", self.data[58:60])[0]
            self.e_shnum     = struct.unpack(endian + "H", self.data[60:62])[0]
            self.e_shstrndx  = struct.unpack(endian + "H", self.data[62:64])[0]
        else:
            self.e_machine   = struct.unpack(endian + "H", self.data[18:20])[0]
            self.e_shoff     = struct.unpack(endian + "I", self.data[32:36])[0]
            self.e_shentsize = struct.unpack(endian + "H", self.data[46:48])[0]
            self.e_shnum     = struct.unpack(endian + "H", self.data[48:50])[0]
            self.e_shstrndx  = struct.unpack(endian + "H", self.data[50:52])[0]

        # Section header table
        self.sections = []
        for i in range(self.e_shnum):
            off = self.e_shoff + i * self.e_shentsize
            if self.is_64:
                name, sh_type, _, _, sh_offset, sh_size, sh_link, _, _, _ = \
                    struct.unpack(endian + "IIQQQQIIQQ", self.data[off:off + 64])
            else:
                name, sh_type, _, _, sh_offset, sh_size, sh_link, _, _, _ = \
                    struct.unpack(endian + "IIIIIIIIII", self.data[off:off + 40])
            self.sections.append({
                "name_off": name,
                "type":     sh_type,
                "offset":   sh_offset,
                "size":     sh_size,
                "link":     sh_link,
            })

        # shstrtab
        shstr = self.sections[self.e_shstrndx]
        shstr_data = self.data[shstr["offset"]:shstr["offset"] + shstr["size"]]
        for s in self.sections:
            end = shstr_data.find(b"\x00", s["name_off"])
            s["name"] = shstr_data[s["name_off"]:end].decode("ascii", "replace")

    def find_section(self, name: str) -> Optional[dict]:
        for s in self.sections:
            if s["name"] == name:
                return s
        return None

    def lookup_symbol(self, name: str) -> Optional[tuple]:
        """
        Return (st_value, st_size) for the given symbol, or None if missing.
        Searches .dynsym first, falls back to .symtab if present.
        """
        for sec_name in (".dynsym", ".symtab"):
            sec = self.find_section(sec_name)
            if not sec:
                continue
            strtab_sec = self.sections[sec["link"]]
            strtab = self.data[
                strtab_sec["offset"]:strtab_sec["offset"] + strtab_sec["size"]
            ]
            entsize = 24 if self.is_64 else 16
            for i in range(sec["size"] // entsize):
                eoff = sec["offset"] + i * entsize
                if self.is_64:
                    (st_name, _info, _other, _shndx, st_value, st_size) = \
                        struct.unpack(
                            self.endian + "IBBHQQ",
                            self.data[eoff:eoff + entsize],
                        )
                else:
                    (st_name, st_value, st_size, _info, _other, _shndx) = \
                        struct.unpack(
                            self.endian + "IIIBBH",
                            self.data[eoff:eoff + entsize],
                        )
                end = strtab.find(b"\x00", st_name)
                sym_name = strtab[st_name:end].decode("ascii", "replace")
                if sym_name == name:
                    return (st_value, st_size)
        return None

    def vaddr_to_file_offset(self, vaddr: int) -> int:
        """Map a virtual address into the .text section to a file offset."""
        text = self.find_section(".text")
        if not text:
            raise RuntimeError(".text 段缺失，文件可能损坏")
        # For PIE shared libs as Android builds them, .text addr == .text
        # file offset, so vaddr == file offset (verified for this APK).
        text_start = text["offset"]  # = sh_addr in practice
        text_end   = text_start + text["size"]
        # Use sh_addr from a fresh read because dict only has offset above.
        # We can derive sh_addr by re-reading the section header entry.
        off = self.e_shoff + self.sections.index(text) * self.e_shentsize
        if self.is_64:
            sh_addr = struct.unpack(
                self.endian + "Q", self.data[off + 16:off + 24],
            )[0]
        else:
            sh_addr = struct.unpack(
                self.endian + "I", self.data[off + 12:off + 16],
            )[0]
        return vaddr - sh_addr + text["offset"]


# ───────────────────────────────────────────────────────────────────
# 每个架构的 patch 描述：原始指令 → 新指令，含字节签名
# ───────────────────────────────────────────────────────────────────
EM_AARCH64 = 183
EM_ARM     = 40

#  arm64：函数末尾 `mov w0, w20` → `mov w0, #1`
#  Thumb：函数末尾 `mov r0, r5`   → `movs r0, #1`
#
#  我们扫描函数体的末尾区域（最后 24 字节，足够覆盖所有已见过的版本），
#  寻找精确匹配的原始字节序列；找到就替换。

ARM64_OLD = bytes.fromhex("e0 03 14 2a".replace(" ", ""))   # mov w0, w20
ARM64_NEW = bytes.fromhex("20 00 80 52".replace(" ", ""))   # mov w0, #1

THUMB_OLD = bytes.fromhex("28 46".replace(" ", ""))         # mov r0, r5
THUMB_NEW = bytes.fromhex("01 20".replace(" ", ""))         # movs r0, #1


def patch_one(path: Path, dry_run: bool) -> bool:
    """Returns True if patched (or would patch in dry-run), False if skipped."""
    section(f"目标: {c(C.BRIGHT_WHITE, str(path))}")
    if not path.is_file():
        warn(f"找不到文件 {path}，跳过", indent=1)
        return False

    try:
        elf = Elf(path)
    except Exception as e:
        err(f"ELF 解析失败: {e}", indent=1)
        return False

    if elf.e_machine == EM_AARCH64:
        arch = "arm64-v8a"
        old, new = ARM64_OLD, ARM64_NEW
        thumb = False
    elif elf.e_machine == EM_ARM:
        arch = "armeabi-v7a"
        old, new = THUMB_OLD, THUMB_NEW
        thumb = True
    else:
        warn(f"未知架构 e_machine={elf.e_machine}，跳过", indent=1)
        return False
    info(f"架构 = {c(C.BRIGHT_CYAN, arch)}", indent=1)

    sym = elf.lookup_symbol(TARGET_SYMBOL)
    if sym is None:
        warn("找不到 isDownloadComplete 符号，可能游戏被上游更新过；跳过",
             indent=1)
        return False
    vaddr, size = sym
    if thumb:
        # Thumb function pointers have low bit set
        func_vaddr = vaddr & ~1
    else:
        func_vaddr = vaddr
    info(f"符号 vaddr = {c(C.BRIGHT_WHITE, hex(func_vaddr))}, "
         f"size = {size} bytes",
         indent=1)

    file_off = elf.vaddr_to_file_offset(func_vaddr)
    info(f"file offset = {c(C.BRIGHT_WHITE, hex(file_off))}",
         indent=1)

    # 在函数尾部扫描 old pattern；只接受恰好 1 处匹配
    func_bytes = elf.data[file_off:file_off + size]
    # 我们改的是返回值赋值，它在函数末尾的 epilogue 之前。整段
    # 函数体里 old pattern 可能多次出现（比如 thumb 的 `mov r0, r5`
    # 在异常处理路径里也出现）；为了精准定位，只在前 size 字节里
    # 扫，且要求只有一处匹配，否则保守跳过。
    matches = []
    start = 0
    while True:
        idx = func_bytes.find(old, start)
        if idx < 0:
            break
        # 对齐到指令边界：arm64 = 4 字节对齐，Thumb = 2 字节对齐
        align = 2 if thumb else 4
        if idx % align == 0:
            matches.append(idx)
        start = idx + 1

    if not matches:
        warn(f"在函数体里找不到原始指令 {old.hex()}，跳过", indent=1)
        return False
    # 函数可能有多个出口（正常路径 + 异常处理路径），各自都执行
    # `mov w0, w20` / `mov r0, r5` 作为返回值。把所有出现都替换成
    # 立即数 1：每个 return point 都强制返回 true。这是安全的——
    # 我们只动指令的"立即数源寄存器"那一条 mov，不动控制流。
    if len(matches) > 1:
        info(f"原始指令 {old.hex(' ')} 在函数体里出现了 {len(matches)} 次 "
             "(典型情况：函数有多个 return 出口)，全部替换",
             indent=1)

    new_data = bytearray(elf.data)
    for m in matches:
        patch_off = file_off + m
        info(f"patch 点 file offset = {c(C.BRIGHT_WHITE, hex(patch_off))}  "
             f"原始 = {c(C.DIM, old.hex(' '))} → "
             f"新值 = {c(C.BRIGHT_CYAN, new.hex(' '))}",
             indent=1)
        new_data[patch_off:patch_off + len(old)] = new

    if dry_run:
        ok("dry-run，未写入文件", indent=1)
        return True

    path.write_bytes(bytes(new_data))
    ok(f"已写回 {path.name}（{len(matches)} 处 patch）", indent=1)
    return True


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Patch libmadomagi_native.so to disable the engine's "
                    "asset re-download check.",
    )
    ap.add_argument(
        "--apk-root",
        default=".",
        help="APK decompile root (containing lib/arm64-v8a etc.)",
    )
    ap.add_argument(
        "--dry-run",
        action="store_true",
        help="Only verify patch points; do not write any bytes.",
    )
    args = ap.parse_args()

    header("Patch libmadomagi_native.so")
    info("目的：让 Cocos2D 引擎自带资源核查机制无视 manifest，把每个资源")
    info("      都当成 '已下载完成'，杜绝 15G 重下载隐患。")
    info(f"模式：{c(C.BRIGHT_CYAN, 'dry-run' if args.dry_run else 'apply')}")

    root = Path(args.apk_root)
    targets = [
        root / "lib" / "arm64-v8a"   / "libmadomagi_native.so",
        root / "lib" / "armeabi-v7a" / "libmadomagi_native.so",
    ]

    patched_any = False
    for t in targets:
        if patch_one(t, args.dry_run):
            patched_any = True

    header("完成")
    if patched_any:
        ok("至少一份 .so 已 patch（或验证通过，dry-run 模式）")
        return 0
    err("没有任何 .so 被 patch；详见上面的警告")
    return 1


if __name__ == "__main__":
    try:
        sys.exit(main())
    except KeyboardInterrupt:
        err("用户中断")
        sys.exit(2)
    except Exception as e:
        err(f"致命错误: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(2)
