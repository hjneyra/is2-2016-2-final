import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/user.dart';

class User_Administrator_Repository {
  DbConnection connection;

  User_Administrator_Repository(this.connection);

  Future<User> find(int id) async {
    User user = (await connection.query('SELECT * FROM "user" WHERE id = @id AND user_type=3', {'id': id})).map(mapRowToUser).first;
    return user;
  }

  Future<List<User>> findAll() async {
    return (await connection.query('SELECT * FROM "user" WHERE user_type=3')).map(mapRowToUser);
  }

  User mapRowToUser(pg.Row row) {
    return new User()
      ..id = row.id
      ..first_name = row.first_name
      ..last_name = row.last_name
      ..email = row.email
      ..account = row.account
      ..password = row.password
      ..user_type = row.user_type;
  }
}