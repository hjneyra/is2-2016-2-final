import '../repository/user_administrator_repository.dart';
import '../model/user.dart';
import 'dart:async';

class User_Administrator_Service {
  User_Administrator_Repository user_administrator_repository;
  User_Administrator_Service(this.user_administrator_repository);

  Future<User> get(int id) {
    return user_administrator_repository.find(id);
  }

  Future<List<User>> getAll() {
    return user_administrator_repository.findAll();
  }
}