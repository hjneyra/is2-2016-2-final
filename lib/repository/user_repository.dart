import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/user.dart';

class UserRepository {
  DbConnection connection;

  UserRepository(this.connection);

  Future<User> find(int id) async {
    User user = (await connection
            .query('SELECT * FROM "user" WHERE id = @id', {'id': id}))
        .map(mapRowToUser)
        .first;
    return user;
  }

  Future<int> insert(User user) async {
    await connection.query(
        'INSERT INTO "user" (first_name, last_name, email) VALUES (@firstName, @lastName, @email)',
        {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email
        });
  }

  Future<Null> update(User user) async {
    await connection.query(
        'UPDATE "user" SET first_name = @firstName, last_name = @lastName, email = @email WHERE id = @id',
        {
          'id': user.id,
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email
        });
  }

  Future<List<User>> findAll() async {
    Iterable<User> users =
        (await connection.query('SELECT * FROM "user"')).map(mapRowToUser);
    return new List.from(users);
  }

  User mapRowToUser(pg.Row row) {
    return new User()
      ..id = row.id
      ..firstName = row.first_name
      ..lastName = row.last_name
      ..email = row.email;
  }
}
