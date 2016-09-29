import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/user_administrator_service.dart';
import '../model/user.dart';

@ApiClass(name: 'user_administrator', version: 'v1', description: 'User server side API')
class User_Administrator_Rest {
  User_Administrator_Service user_administrator_service;

  User_Administrator_Rest(this.user_administrator_service);

  @ApiMethod(path: 'user_administrator/{id}')
  Future<User> getUser(String id) {
    return user_administrator_service.get(int.parse(id));
  }

  @ApiMethod(path: 'all')
  Future<List<User>> getUsers() {
    return user_administrator_service.getAll();
  }
}
