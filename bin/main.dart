import 'dart:io';
import 'dart:async';
import 'package:rpc/rpc.dart';

import 'package:logistic_app/config/injector.dart';
import 'package:logistic_app/rest/user_rest.dart';
import 'package:logistic_app/rest/user_product_register_rest.dart';
import 'package:logistic_app/rest/hello_rest.dart';

final ApiServer _apiServer = new ApiServer();

_sendNotFound(HttpResponse response) {
  response.statusCode = HttpStatus.NOT_FOUND;
  response.close();
}

void addCorsHeaders(HttpResponse response) {
  response.headers
//    ..set('Access-Control-Allow-Origin', 'http://localhost:8080')
//    ..add("Access-Control-Allow-Credentials", "true")
    ..add("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT")
    ..add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, x-dart-application-json");
//    ..add("Access-Control-Allow-Headers", "Origin, X-Requested-With, content-type, Accept, x-dart-application-json");
}

Future configureHttpServer(HttpRequest request) async {
  HttpResponse response = request.response;
//  addCorsHeaders(response);
  print("Processing req: ${request.method} -> ${request.headers}");
  if (request.method == 'OPTIONS') {
    print("processing OPTIONS");
    HttpResponse res = request.response;
    res.statusCode = HttpStatus.OK;
    res.close();
    return;
//    return request;
  }

  final String basePath = "/tmp";
  final String path = request.uri.toFilePath();
  // PENDING: Do more security checks here.
  final String resultPath = path == '/' ? '/index.html' : path;
  final File file = new File('${basePath}${resultPath}');
  if (await file.exists()) {
    try {
      await file.openRead().pipe(request.response);
    } catch (e) {
      print(e);
    }
  } else {
//    _sendNotFound(request.response);
    addCorsHeaders(request.response);
    _apiServer.httpRequestHandler(request).whenComplete(() {
//      addCorsHeaders(request.response);
    });
  }
}

main() async {
  _apiServer.addApi(injector.get(UserRest));
  _apiServer.addApi(injector.get(User_Product_Register_Rest));
  _apiServer.addApi(injector.get(HelloRest));
  HttpServer server = await HttpServer.bind(InternetAddress.ANY_IP_V4, 9090);
//  server.listen(_apiServer.httpRequestHandler);
  server.listen(configureHttpServer);
}
