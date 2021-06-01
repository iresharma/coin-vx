// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CoinsAPI extends CoinsAPI {
  _$CoinsAPI([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CoinsAPI;

  @override
  Future<Response<dynamic>> tweets(String coinId) {
    final $url = '/coins/$coinId/twitter';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
