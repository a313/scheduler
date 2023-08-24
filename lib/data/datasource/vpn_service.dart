// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import '../../core/network/api_service.dart';

abstract class VpnService extends ApiService {
  Future<Response> getVpnServers();
}

class VpnServiceImp extends VpnService {
  @override
  String get domain => 'https://www.vpngate.net';
  @override
  Future<Response> getVpnServers() {
    return getData(endPoint: '/api/iphone/');
  }
}
