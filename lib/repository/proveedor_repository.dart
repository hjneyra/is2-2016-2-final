import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/proveedor.dart';

class ProveedorRepository {
  DbConnection connection;

  ProveedorRepository(this.connection);

  Future<Proveedor> find(int id) async {
    Proveedor proveedor = (await connection.query(
        'SELECT * FROM "proveedor" WHERE id = @id', {'id': id}))
        .map(mapRowToProveedor)
        .first;
    return proveedor;
  }

  Future<List<Proveedor>> findAll() async {
    return (await connection.query('SELECT * FROM "proveedor"')).map(
        mapRowToProveedor);
  }

  Proveedor mapRowToProveedor(pg.Row row) {
    return new Proveedor()
      ..id = row.id
      ..nombre = row.nombre;
  }
}