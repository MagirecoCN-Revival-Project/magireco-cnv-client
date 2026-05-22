package io.kamihama.magianative;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * 玩家操作状态的 SQLite 持久化层。
 *
 * 每条记录代表"玩家主动提交某个端点后服务器确认的最终状态"，
 * 包含原始请求体（req_json，用于下次会话回放）和服务端响应体（resp_json，
 * 用于 GET 请求的即时注入，跳过回放时序问题）。
 *
 * account_id 目前绑定设备 ID，为未来账号系统留有多租户空间。
 */
public final class PlayerStateCache {

    private static final String DB_NAME    = "cnv_state.db";
    private static final int    DB_VERSION = 1;
    private static final String TABLE      = "player_state";

    private static volatile PlayerStateCache instance;

    private final SQLiteOpenHelper helper;

    private PlayerStateCache(Context ctx) {
        helper = new SQLiteOpenHelper(ctx.getApplicationContext(), DB_NAME, null, DB_VERSION) {
            @Override
            public void onCreate(SQLiteDatabase db) {
                db.execSQL(
                    "CREATE TABLE " + TABLE + "(" +
                    "  account_id TEXT NOT NULL," +
                    "  endpoint   TEXT NOT NULL," +
                    "  req_json   TEXT," +
                    "  resp_json  TEXT," +
                    "  updated_at INTEGER NOT NULL," +
                    "  PRIMARY KEY (account_id, endpoint))"
                );
            }
            @Override
            public void onUpgrade(SQLiteDatabase db, int old, int nw) {
                db.execSQL("DROP TABLE IF EXISTS " + TABLE);
                onCreate(db);
            }
        };
    }

    public static PlayerStateCache get(Context ctx) {
        if (instance == null) {
            synchronized (PlayerStateCache.class) {
                if (instance == null) instance = new PlayerStateCache(ctx);
            }
        }
        return instance;
    }

    /** 保存或更新某账号在某端点的请求体和响应体。 */
    public void save(String accountId, String endpoint, String reqJson, String respJson) {
        ContentValues cv = new ContentValues();
        cv.put("account_id", accountId);
        cv.put("endpoint",   endpoint);
        cv.put("req_json",   reqJson);
        cv.put("resp_json",  respJson);
        cv.put("updated_at", System.currentTimeMillis());
        helper.getWritableDatabase()
              .insertWithOnConflict(TABLE, null, cv, SQLiteDatabase.CONFLICT_REPLACE);
    }

    /**
     * 取某账号某端点的 resp_json（用于 GET 注入）。
     * 没有缓存时返回 null。
     */
    public String loadRespJson(String accountId, String endpoint) {
        Cursor c = helper.getReadableDatabase().query(
            TABLE, new String[]{"resp_json"},
            "account_id=? AND endpoint=? AND resp_json IS NOT NULL",
            new String[]{accountId, endpoint},
            null, null, null);
        try {
            return c.moveToFirst() ? c.getString(0) : null;
        } finally {
            c.close();
        }
    }

    /**
     * 取某账号所有端点的缓存，序列化为 JSON 对象字符串。
     * 格式：{ "/magica/api/user/deck": { "req": "...", "resp": "..." }, ... }
     */
    public String loadAll(String accountId) {
        Cursor c = helper.getReadableDatabase().query(
            TABLE, new String[]{"endpoint", "req_json", "resp_json"},
            "account_id=?", new String[]{accountId},
            null, null, "updated_at ASC");
        JSONObject out = new JSONObject();
        try {
            while (c.moveToNext()) {
                String ep   = c.getString(0);
                String req  = c.getString(1);
                String resp = c.getString(2);
                JSONObject entry = new JSONObject();
                try {
                    if (req  != null && !req.isEmpty())  entry.put("req",  req);
                    if (resp != null && !resp.isEmpty()) entry.put("resp", resp);
                    out.put(ep, entry);
                } catch (JSONException ignored) {}
            }
        } finally {
            c.close();
        }
        return out.toString();
    }

    public void delete(String accountId, String endpoint) {
        helper.getWritableDatabase().delete(
            TABLE, "account_id=? AND endpoint=?", new String[]{accountId, endpoint});
    }

    public void clearAccount(String accountId) {
        helper.getWritableDatabase().delete(
            TABLE, "account_id=?", new String[]{accountId});
    }
}
