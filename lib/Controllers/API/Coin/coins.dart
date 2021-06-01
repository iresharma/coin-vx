import 'package:chopper/chopper.dart';

import '../interceptors/logger.dart';

part 'coins.chopper.dart';

@ChopperApi(baseUrl: '/coins')
abstract class CoinsAPI extends ChopperService {
  static CoinsAPI create() {
    var client = ChopperClient(
      baseUrl: 'https://api.coinpaprika.com/v1/',
      services: [_$CoinsAPI()],
      interceptors: [
        CurlInterceptor(),
        const HeadersInterceptor({'Content-type': 'Application/json'}),
        LoggerRequestInterceptor(),
        LoggerResponseInterceptor(),
      ],
      converter: const JsonConverter(),
    );
    return _$CoinsAPI(client);
  }
  @Get(path: '/{coinId}/twitter')
  Future<Response> tweets(@Path() String coinId);
}

