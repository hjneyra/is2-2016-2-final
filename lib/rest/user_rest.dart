import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/user_service.dart';
import '../model/user.dart';

class UserRest {
  UserService userService;

  UserRest(this.userService);

  @ApiMethod(path: 'user')
  Future<User> getUser({String id}) {
    return userService.get(int.parse(id));
  }

  @ApiMethod(path: 'users')
  Future<List<User>> getUsers() {
    return userService.getAll();
  }

  @ApiMethod(path: 'users', method: "PUT")
  Future<User> updateUser(User user) {
    return userService.save(user);
  }

}
