import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/persona.dart';

class PersonaRepository {
  DbConnection connection;

  PersonaRepository(this.connection);

  Future<Persona> find(int id) async {
    Persona persona = (await connection.query('SELECT * FROM "persona" WHERE id = @id', {'id': id})).map(mapRowToPersona).first;
    return persona;
  }

  Future<List<Persona>> findAll() async {
    return (await connection.query('SELECT * FROM "persona"')).map(mapRowToPersona);
  }

  Persona mapRowToPersona(pg.Row row) {
    return new Persona()
      ..id = row.id
      ..nombre = row.nombre
      ..email = row.email
      ..telefono = row.telefono
      ..direccion = row.direccion;
  }
}
