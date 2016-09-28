import 'package:di/di.dart';

import 'db_connection.dart';
import '../repository/user_repository.dart';
import '../repository/user_product_register_repository.dart';
import '../service/user_service.dart';
import '../service/user_product_register_service.dart';
import '../rest/user_rest.dart';
import '../rest/user_product_register_rest.dart';
import '../rest/hello_rest.dart';

var injector = new ModuleInjector([new Module()

  ..bind(DbConnection)

  // repositories
  ..bind(UserRepository)
  ..bind(User_Product_Register_Repository)

  // services
  ..bind(UserService)
  ..bind(User_Product_Register_Service)

  // REST controllers
  ..bind(HelloRest)
  ..bind(UserRest)
  ..bind(User_Product_Register_Rest)
]);
