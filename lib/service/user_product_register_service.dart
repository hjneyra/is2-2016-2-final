import '../repository/user_product_register_repository.dart';
import '../model/user.dart';
import 'dart:async';

class User_Product_Register_Service {
  User_Product_Register_Repository user_product_register_repository;
  User_Product_Register_Service(this.user_product_register_repository);

  Future<User> get(int id) {
    return user_product_register_repository.find(id);
  }

  Future<List<User>> getAll() {
    return user_product_register_repository.findAll();
  }
}