import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/proveedor_service.dart';
import '../model/proveedor.dart';

@ApiClass(name: 'proveedor', version: 'v1', description: 'User server side API')
class ProveedorRest {
  ProveedorService proveedorService;

  ProveedorRest(this.proveedorService);

  @ApiMethod(path: 'proveedor/{id}')
  Future<Proveedor> getProveedor(String id) {
    return proveedorService.get(int.parse(id));
  }

  @ApiMethod(path: 'all')
  Future<List<Proveedor>> getProveedores() {
    return proveedorService.getAll();
  }
}
