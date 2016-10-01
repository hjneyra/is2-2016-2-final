import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/user_service.dart';
import '../model/user.dart';

@ApiClass(name: 'hello', version: 'v1', description: 'Hello server side API')
class HelloRest {

  @ApiMethod(path: 'world/{name}')
  HelloWorldResponse getUser(String name) {
    return new HelloWorldResponse()..message = "Hello World: $name!";
  }
}

class HelloWorldResponse {
  String message;
}
