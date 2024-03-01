// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vpn_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VpnInfoModelImpl _$$VpnInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$VpnInfoModelImpl(
      json['HostName'] as String,
      json['IP'] as String,
      json['Score'] as num,
      json['Ping'] as num,
      json['Speed'] as num,
      json['CountryLong'] as String,
      json['CountryShort'] as String,
      json['NumVpnSessions'] as num,
      json['Uptime'] as num,
      json['TotalUsers'] as num,
      json['TotalTraffic'] as num,
      json['LogType'] as String,
      json['Operator'] as String,
      json['Message'] as String,
      json['OpenVPN_ConfigData_Base64'] as String,
    );

Map<String, dynamic> _$$VpnInfoModelImplToJson(_$VpnInfoModelImpl instance) =>
    <String, dynamic>{
      'HostName': instance.HostName,
      'IP': instance.IP,
      'Score': instance.Score,
      'Ping': instance.Ping,
      'Speed': instance.Speed,
      'CountryLong': instance.CountryLong,
      'CountryShort': instance.CountryShort,
      'NumVpnSessions': instance.NumVpnSessions,
      'Uptime': instance.Uptime,
      'TotalUsers': instance.TotalUsers,
      'TotalTraffic': instance.TotalTraffic,
      'LogType': instance.LogType,
      'Operator': instance.Operator,
      'Message': instance.Message,
      'OpenVPN_ConfigData_Base64': instance.OpenVPN_ConfigData_Base64,
    };
