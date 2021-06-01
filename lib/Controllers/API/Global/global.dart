import 'package:chopper/chopper.dart';

import '../interceptors/logger.dart';

part 'global.chopper.dart';

@ChopperApi(baseUrl: '/global')
abstract class GlobalAPI extends ChopperService {
  static GlobalAPI create() {
    var client = ChopperClient(
      baseUrl: 'https://api.coinpaprika.com/v1/',
      services: [_$GlobalAPI()],
      interceptors: [
        CurlInterceptor(),
        const HeadersInterceptor({'Content-type': 'Application/json'}),
        LoggerRequestInterceptor(),
        LoggerResponseInterceptor(),
      ],
      converter: const JsonConverter(),
    );
    return _$GlobalAPI(client);
  }
  @Get(path: '/')
  Future<Response> globalData();
}

