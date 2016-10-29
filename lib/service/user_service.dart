import '../repository/user_repository.dart';
import '../model/user.dart';
import 'dart:async';

class UserService {
  UserRepository userRepository;
  UserService(this.userRepository);

  Future<User> get(int id) {
    return userRepository.find(id);
  }

  Future<List<User>> getAll() {
    return userRepository.findAll();
  }

  Future<User> save(User user) async {
    if (user.id == null) {
      await userRepository.insert(user);
    } else {
      await userRepository.update(user);
    }
    return userRepository.find(user.id);
  }

}