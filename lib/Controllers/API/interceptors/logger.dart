import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:coin_vx/main.dart';

class LoggerRequestInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    String report = '''
      Request endpoint: ${request.baseUrl}${request.url}\n
      Request params: ${request.parameters}\n
      Request method: ${request.method}\n
      Request headers: ${request.headers}
    ''';
    if (request.method == 'POST') {
      report += 'Request body: ${request.body}\n';
    }
    logger.d(report);
    return request;
  }
}

class LoggerResponseInterceptor extends ResponseInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) {
    if (response.statusCode == 200) {
      logger.d('Response: ${response.body}');
    } else {
      String? path = response.headers['request-path'];
      logger.e(
          'Response path: $path\nResponse Error: ${response.statusCode}\n Error: ${response.error}');
    }
    return response;
  }
}