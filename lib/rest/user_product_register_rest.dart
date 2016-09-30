import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/user_product_register_service.dart';
import '../model/user.dart';

@ApiClass(name: 'user_product_register', version: 'v1', description: 'User server side API')
class User_Product_Register_Rest {
  User_Product_Register_Service user_product_register_service;

  User_Product_Register_Rest(this.user_product_register_service);

  @ApiMethod(path: 'user_product_register/{id}')
  Future<User> getUser(String id) {
    return user_product_register_service.get(int.parse(id));
  }

  @ApiMethod(path: 'all')
  Future<List<User>> getUsers() {
    return user_product_register_service.getAll();
  }
}
