import 'package:di/di.dart';

import 'db_connection.dart';
import '../repository/user_repository.dart';
import '../repository/persona_repository.dart';
import '../repository/proveedor_repository.dart';

import '../service/user_service.dart';
import '../service/persona_service.dart';
import '../service/proveedor_service.dart';

import '../rest/user_rest.dart';
import '../rest/hello_rest.dart';
import '../rest/persona_rest.dart';
import '../rest/proveedor_rest.dart';


var injector = new ModuleInjector([new Module()

  ..bind(DbConnection)

  // repositories
  ..bind(UserRepository)
  ..bind(PersonaRepository)
  ..bind(ProveedorRepository)

  // services
  ..bind(UserService)
  ..bind(PersonaService)
  ..bind(ProveedorService)

// REST controllers
  ..bind(HelloRest)
  ..bind(UserRest)
  ..bind(PersonaRest)
  ..bind(ProveedorRest)
]);
