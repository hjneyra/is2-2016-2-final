import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/user_service.dart';
import '../model/user.dart';

class HelloRest {
  @ApiMethod(path: 'hello/{name}')
  HelloWorldResponse getUser(String name) {
    return new HelloWorldResponse()..message = "Hello World: $name!";
  }
}

class HelloWorldResponse {
  String message;
}