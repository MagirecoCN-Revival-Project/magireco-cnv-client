package io.kamihama.cnv;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * S3 风格的 {@code ListBucketResult} XML 解析器。
 *
 * <p>使用正则直接从 XML 文本中抓取每个 {@code <Contents>} 块下的
 * {@code <Key>} 和 {@code <Size>}，足够覆盖魔法纪录所用 S3 桶返回的
 * 标准格式。不依赖任何 XML 库 / SAX / DOM。
 */
public final class S3List {
    /** 一条文件条目：S3 对象的键名 + 字节大小。 */
    public static final class Entry {
        public final String key;
        public final long size;
        public Entry(String k, long s) { key = k; size = s; }
    }

    /** 匹配单个 {@code <Contents>...</Contents>} 块。 */
    private static final Pattern CONTENTS = Pattern.compile(
            "<Contents\\b[^>]*>(.*?)</Contents>", Pattern.DOTALL);
    /** 块内匹配 {@code <Key>...</Key>}。 */
    private static final Pattern KEY = Pattern.compile(
            "<Key\\b[^>]*>(.*?)</Key>", Pattern.DOTALL);
    /** 块内匹配 {@code <Size>...</Size>}。 */
    private static final Pattern SIZE = Pattern.compile(
            "<Size\\b[^>]*>(.*?)</Size>", Pattern.DOTALL);

    private S3List() {}

    /**
     * 解析 S3 XML，返回所有 (key, size) 条目。
     * 输入为空或不含合法块时返回空 list；不抛异常。
     */
    public static List<Entry> parse(String xml) {
        ArrayList<Entry> out = new ArrayList<>();
        if (xml == null || xml.isEmpty()) return out;
        Matcher m = CONTENTS.matcher(xml);
        while (m.find()) {
            String chunk = m.group(1);
            Matcher k = KEY.matcher(chunk);
            Matcher s = SIZE.matcher(chunk);
            if (k.find() && s.find()) {
                String key = k.group(1).trim();
                long size;
                try { size = Long.parseLong(s.group(1).trim()); }
                catch (NumberFormatException nfe) { size = -1L; }
                if (!key.isEmpty()) out.add(new Entry(key, size));
            }
        }
        return out;
    }
}
