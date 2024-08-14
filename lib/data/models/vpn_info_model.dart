// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aio/domain/entities/vpn_info.dart';

part 'vpn_info_model.freezed.dart';
part 'vpn_info_model.g.dart';

@freezed
class VpnInfoModel extends VpnInfo with _$VpnInfoModel {
  factory VpnInfoModel(
    final String HostName,
    final String IP,
    final num Score,
    final num Ping,
    final num Speed,
    final String CountryLong,
    final String CountryShort,
    final num NumVpnSessions,
    final num Uptime,
    final num TotalUsers,
    final num TotalTraffic,
    final String LogType,
    final String Operator,
    final String Message,
    final String OpenVPN_ConfigData_Base64,
  ) = _VpnInfoModel;

  factory VpnInfoModel.fromJson(Map<String, dynamic> json) =>
      _$VpnInfoModelFromJson(json);
}
