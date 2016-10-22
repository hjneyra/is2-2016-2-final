import 'dart:io';
import 'dart:async';
import 'package:rpc/rpc.dart';

import 'package:logistic_app/config/injector.dart';
import 'package:logistic_app/rest/api_rest.dart';

final ApiServer _apiServer = new ApiServer();

_sendNotFound(HttpResponse response) {
  response.statusCode = HttpStatus.NOT_FOUND;
  response.close();
}


Future configureHttpServer(HttpRequest request) async {
  HttpResponse response = request.response;
  print("Processing req: ${request.method} -> ${request.headers}");
  if (request.method == 'OPTIONS') {
    print("processing OPTIONS");
    HttpResponse res = request.response;
    res.statusCode = HttpStatus.OK;
    res.close();
    return;
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
    _apiServer.httpRequestHandler(request).whenComplete(() {
    });
  }
}

main() async {
  _apiServer.addApi(injector.get(ApiRest));
  HttpServer server = await HttpServer.bind(InternetAddress.ANY_IP_V4, 9090);
  server.listen(_apiServer.httpRequestHandler);
//  server.listen(configureHttpServer);
}
