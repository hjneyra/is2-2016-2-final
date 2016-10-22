import 'package:rpc/rpc.dart';
import 'user_rest.dart';
import 'hello_rest.dart';

@ApiClass(name: 'rest', version: 'v1', description: 'REST API')
class ApiRest {

  @ApiResource(name: 'user')
  UserRest userRest;
  @ApiResource(name: 'res')
  HelloRest helloRest;

  ApiRest(this.userRest, this.helloRest);
}
