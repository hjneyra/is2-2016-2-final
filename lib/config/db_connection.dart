import 'dart:async';
import 'package:postgresql/postgresql.dart' as pg;

class DbConnection {
  static final String hostname = "localhost";
  static final String username = "postgres";
  static final String password = "postgres";
  static final String database = "Gestion_inventarios";
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
    try {
      pg.Connection conn = await pg.connect(URI);
      return await conn.query(sql, params).toList();
    } catch (e) {
      print(e);
    }
  }
}
