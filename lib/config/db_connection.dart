import 'dart:async';
import 'package:postgresql/postgresql.dart' as pg;

class DbConnection {
  static final String hostname = "localhost";
  static final String username = "postgres";
  static final String password = "postgres";
  static final String database = "testdb";
  static final int port = 5432;
  static final String URI = 'postgres://$username:$password@$hostname:$port/$database';

  DbConnection();

  void init() {
    String sql = "SELECT 'oi'";

    pg.connect(URI).then((conn) {
      conn.query(sql).toList().then((result) {
        print('result: $result');
      }).whenComplete(() {
        conn.close();
      });
    });
  }

  Future<List<pg.Row>> query(String sql, [params]) async {
    pg.Connection conn = null;
    try {
      conn = await pg.connect(URI);
      return await conn.query(sql, params).toList();
    } catch (e) {
      print(e);
    } finally {
      if (conn != null) {
        conn.close();
      }
    }
  }

  Future<Null> runInTransaction(String sql, [params]) async {
    pg.Connection conn = null;
    try {
      conn = await pg.connect(URI);
      conn.runInTransaction(() {
        return conn.query(sql, params);
      });
      List<pg.Row> result = await conn.query(sql, params).toList();
      return result;
    } catch (e) {
      print(e);
    } finally {
      if (conn != null) {
        conn.close();
      }
    }
  }
}
