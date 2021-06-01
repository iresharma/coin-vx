// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$GlobalAPI extends GlobalAPI {
  _$GlobalAPI([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GlobalAPI;

  @override
  Future<Response<dynamic>> globalData() {
    final $url = '/global/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
