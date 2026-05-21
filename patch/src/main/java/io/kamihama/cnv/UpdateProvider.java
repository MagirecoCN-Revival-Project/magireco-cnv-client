package io.kamihama.cnv;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;

import java.io.File;
import java.io.FileNotFoundException;

/**
 * 给系统安装器递交 {@code client.apk} 用的极简 {@link ContentProvider}。
 *
 * <p>原本类似场景一般会用 {@code androidx.core.content.FileProvider}，
 * 但本仓库希望 patch 自身**不依赖 androidx**（编译期更轻、合并 dex
 * 后冲突更少），所以自己实现一个最小可用的 ContentProvider：
 * <ul>
 *   <li>{@link #query} 只回报 display name 和 size，足够安装器读 metadata；</li>
 *   <li>{@link #openFile} 只读返回 cacheDir 下的 client_update.apk；</li>
 *   <li>其余 CRUD 一律 no-op。</li>
 * </ul>
 *
 * <p>使用方式：
 * <pre>{@code
 *     Intent it = new Intent(Intent.ACTION_VIEW);
 *     it.setDataAndType(UpdateProvider.uriForStagedApk(),
 *                       "application/vnd.android.package-archive");
 *     it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_GRANT_READ_URI_PERMISSION);
 *     startActivity(it);
 * }</pre>
 */
public class UpdateProvider extends ContentProvider {

    /** ContentProvider authority；与 AndroidManifest.xml 中的声明一致。 */
    public static final String AUTHORITY = "io.kamihama.totentanz.cnvupdate";
    /** 暂存在 cacheDir 下的 APK 文件名。 */
    public static final String FILE_NAME = "client_update.apk";

    /** 返回 cacheDir 下的目标文件路径。下载和安装两端共用这一条路径。 */
    public static File getStagedApk(Context ctx) {
        return new File(ctx.getCacheDir(), FILE_NAME);
    }

    /** 返回供 {@code ACTION_VIEW} Intent 使用的 content:// URI。 */
    public static Uri uriForStagedApk() {
        return Uri.parse("content://" + AUTHORITY + "/" + FILE_NAME);
    }

    @Override public boolean onCreate() { return true; }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection,
                        String[] selectionArgs, String sortOrder) {
        if (projection == null) {
            projection = new String[] { OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE };
        }
        Context ctx = getContext();
        if (ctx == null) return null;
        File file = getStagedApk(ctx);
        MatrixCursor c = new MatrixCursor(projection, 1);
        Object[] row = new Object[projection.length];
        for (int i = 0; i < projection.length; i++) {
            String col = projection[i];
            if (OpenableColumns.DISPLAY_NAME.equalsIgnoreCase(col)) row[i] = FILE_NAME;
            else if (OpenableColumns.SIZE.equalsIgnoreCase(col)) row[i] = file.length();
            else row[i] = null;
        }
        c.addRow(row);
        return c;
    }

    @Override
    public String getType(Uri uri) { return "application/vnd.android.package-archive"; }

    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int delete(Uri uri, String selection, String[] selectionArgs) { return 0; }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) { return 0; }

    @Override
    public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        Context ctx = getContext();
        if (ctx == null) throw new FileNotFoundException("no context");
        File file = getStagedApk(ctx);
        if (!file.exists()) throw new FileNotFoundException("update apk not staged");
        return ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
    }
}
