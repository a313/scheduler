// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vpn_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VpnInfoModel _$VpnInfoModelFromJson(Map<String, dynamic> json) {
  return _VpnInfoModel.fromJson(json);
}

/// @nodoc
mixin _$VpnInfoModel {
  String get HostName => throw _privateConstructorUsedError;
  String get IP => throw _privateConstructorUsedError;
  num get Score => throw _privateConstructorUsedError;
  num get Ping => throw _privateConstructorUsedError;
  num get Speed => throw _privateConstructorUsedError;
  String get CountryLong => throw _privateConstructorUsedError;
  String get CountryShort => throw _privateConstructorUsedError;
  num get NumVpnSessions => throw _privateConstructorUsedError;
  num get Uptime => throw _privateConstructorUsedError;
  num get TotalUsers => throw _privateConstructorUsedError;
  num get TotalTraffic => throw _privateConstructorUsedError;
  String get LogType => throw _privateConstructorUsedError;
  String get Operator => throw _privateConstructorUsedError;
  String get Message => throw _privateConstructorUsedError;
  String get OpenVPN_ConfigData_Base64 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VpnInfoModelCopyWith<VpnInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VpnInfoModelCopyWith<$Res> {
  factory $VpnInfoModelCopyWith(
          VpnInfoModel value, $Res Function(VpnInfoModel) then) =
      _$VpnInfoModelCopyWithImpl<$Res, VpnInfoModel>;
  @useResult
  $Res call(
      {String HostName,
      String IP,
      num Score,
      num Ping,
      num Speed,
      String CountryLong,
      String CountryShort,
      num NumVpnSessions,
      num Uptime,
      num TotalUsers,
      num TotalTraffic,
      String LogType,
      String Operator,
      String Message,
      String OpenVPN_ConfigData_Base64});
}

/// @nodoc
class _$VpnInfoModelCopyWithImpl<$Res, $Val extends VpnInfoModel>
    implements $VpnInfoModelCopyWith<$Res> {
  _$VpnInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? HostName = null,
    Object? IP = null,
    Object? Score = null,
    Object? Ping = null,
    Object? Speed = null,
    Object? CountryLong = null,
    Object? CountryShort = null,
    Object? NumVpnSessions = null,
    Object? Uptime = null,
    Object? TotalUsers = null,
    Object? TotalTraffic = null,
    Object? LogType = null,
    Object? Operator = null,
    Object? Message = null,
    Object? OpenVPN_ConfigData_Base64 = null,
  }) {
    return _then(_value.copyWith(
      HostName: null == HostName
          ? _value.HostName
          : HostName // ignore: cast_nullable_to_non_nullable
              as String,
      IP: null == IP
          ? _value.IP
          : IP // ignore: cast_nullable_to_non_nullable
              as String,
      Score: null == Score
          ? _value.Score
          : Score // ignore: cast_nullable_to_non_nullable
              as num,
      Ping: null == Ping
          ? _value.Ping
          : Ping // ignore: cast_nullable_to_non_nullable
              as num,
      Speed: null == Speed
          ? _value.Speed
          : Speed // ignore: cast_nullable_to_non_nullable
              as num,
      CountryLong: null == CountryLong
          ? _value.CountryLong
          : CountryLong // ignore: cast_nullable_to_non_nullable
              as String,
      CountryShort: null == CountryShort
          ? _value.CountryShort
          : CountryShort // ignore: cast_nullable_to_non_nullable
              as String,
      NumVpnSessions: null == NumVpnSessions
          ? _value.NumVpnSessions
          : NumVpnSessions // ignore: cast_nullable_to_non_nullable
              as num,
      Uptime: null == Uptime
          ? _value.Uptime
          : Uptime // ignore: cast_nullable_to_non_nullable
              as num,
      TotalUsers: null == TotalUsers
          ? _value.TotalUsers
          : TotalUsers // ignore: cast_nullable_to_non_nullable
              as num,
      TotalTraffic: null == TotalTraffic
          ? _value.TotalTraffic
          : TotalTraffic // ignore: cast_nullable_to_non_nullable
              as num,
      LogType: null == LogType
          ? _value.LogType
          : LogType // ignore: cast_nullable_to_non_nullable
              as String,
      Operator: null == Operator
          ? _value.Operator
          : Operator // ignore: cast_nullable_to_non_nullable
              as String,
      Message: null == Message
          ? _value.Message
          : Message // ignore: cast_nullable_to_non_nullable
              as String,
      OpenVPN_ConfigData_Base64: null == OpenVPN_ConfigData_Base64
          ? _value.OpenVPN_ConfigData_Base64
          : OpenVPN_ConfigData_Base64 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VpnInfoModelImplCopyWith<$Res>
    implements $VpnInfoModelCopyWith<$Res> {
  factory _$$VpnInfoModelImplCopyWith(
          _$VpnInfoModelImpl value, $Res Function(_$VpnInfoModelImpl) then) =
      __$$VpnInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String HostName,
      String IP,
      num Score,
      num Ping,
      num Speed,
      String CountryLong,
      String CountryShort,
      num NumVpnSessions,
      num Uptime,
      num TotalUsers,
      num TotalTraffic,
      String LogType,
      String Operator,
      String Message,
      String OpenVPN_ConfigData_Base64});
}

/// @nodoc
class __$$VpnInfoModelImplCopyWithImpl<$Res>
    extends _$VpnInfoModelCopyWithImpl<$Res, _$VpnInfoModelImpl>
    implements _$$VpnInfoModelImplCopyWith<$Res> {
  __$$VpnInfoModelImplCopyWithImpl(
      _$VpnInfoModelImpl _value, $Res Function(_$VpnInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? HostName = null,
    Object? IP = null,
    Object? Score = null,
    Object? Ping = null,
    Object? Speed = null,
    Object? CountryLong = null,
    Object? CountryShort = null,
    Object? NumVpnSessions = null,
    Object? Uptime = null,
    Object? TotalUsers = null,
    Object? TotalTraffic = null,
    Object? LogType = null,
    Object? Operator = null,
    Object? Message = null,
    Object? OpenVPN_ConfigData_Base64 = null,
  }) {
    return _then(_$VpnInfoModelImpl(
      null == HostName
          ? _value.HostName
          : HostName // ignore: cast_nullable_to_non_nullable
              as String,
      null == IP
          ? _value.IP
          : IP // ignore: cast_nullable_to_non_nullable
              as String,
      null == Score
          ? _value.Score
          : Score // ignore: cast_nullable_to_non_nullable
              as num,
      null == Ping
          ? _value.Ping
          : Ping // ignore: cast_nullable_to_non_nullable
              as num,
      null == Speed
          ? _value.Speed
          : Speed // ignore: cast_nullable_to_non_nullable
              as num,
      null == CountryLong
          ? _value.CountryLong
          : CountryLong // ignore: cast_nullable_to_non_nullable
              as String,
      null == CountryShort
          ? _value.CountryShort
          : CountryShort // ignore: cast_nullable_to_non_nullable
              as String,
      null == NumVpnSessions
          ? _value.NumVpnSessions
          : NumVpnSessions // ignore: cast_nullable_to_non_nullable
              as num,
      null == Uptime
          ? _value.Uptime
          : Uptime // ignore: cast_nullable_to_non_nullable
              as num,
      null == TotalUsers
          ? _value.TotalUsers
          : TotalUsers // ignore: cast_nullable_to_non_nullable
              as num,
      null == TotalTraffic
          ? _value.TotalTraffic
          : TotalTraffic // ignore: cast_nullable_to_non_nullable
              as num,
      null == LogType
          ? _value.LogType
          : LogType // ignore: cast_nullable_to_non_nullable
              as String,
      null == Operator
          ? _value.Operator
          : Operator // ignore: cast_nullable_to_non_nullable
              as String,
      null == Message
          ? _value.Message
          : Message // ignore: cast_nullable_to_non_nullable
              as String,
      null == OpenVPN_ConfigData_Base64
          ? _value.OpenVPN_ConfigData_Base64
          : OpenVPN_ConfigData_Base64 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VpnInfoModelImpl implements _VpnInfoModel {
  _$VpnInfoModelImpl(
      this.HostName,
      this.IP,
      this.Score,
      this.Ping,
      this.Speed,
      this.CountryLong,
      this.CountryShort,
      this.NumVpnSessions,
      this.Uptime,
      this.TotalUsers,
      this.TotalTraffic,
      this.LogType,
      this.Operator,
      this.Message,
      this.OpenVPN_ConfigData_Base64);

  factory _$VpnInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VpnInfoModelImplFromJson(json);

  @override
  final String HostName;
  @override
  final String IP;
  @override
  final num Score;
  @override
  final num Ping;
  @override
  final num Speed;
  @override
  final String CountryLong;
  @override
  final String CountryShort;
  @override
  final num NumVpnSessions;
  @override
  final num Uptime;
  @override
  final num TotalUsers;
  @override
  final num TotalTraffic;
  @override
  final String LogType;
  @override
  final String Operator;
  @override
  final String Message;
  @override
  final String OpenVPN_ConfigData_Base64;

  @override
  String toString() {
    return 'VpnInfoModel(HostName: $HostName, IP: $IP, Score: $Score, Ping: $Ping, Speed: $Speed, CountryLong: $CountryLong, CountryShort: $CountryShort, NumVpnSessions: $NumVpnSessions, Uptime: $Uptime, TotalUsers: $TotalUsers, TotalTraffic: $TotalTraffic, LogType: $LogType, Operator: $Operator, Message: $Message, OpenVPN_ConfigData_Base64: $OpenVPN_ConfigData_Base64)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VpnInfoModelImpl &&
            (identical(other.HostName, HostName) ||
                other.HostName == HostName) &&
            (identical(other.IP, IP) || other.IP == IP) &&
            (identical(other.Score, Score) || other.Score == Score) &&
            (identical(other.Ping, Ping) || other.Ping == Ping) &&
            (identical(other.Speed, Speed) || other.Speed == Speed) &&
            (identical(other.CountryLong, CountryLong) ||
                other.CountryLong == CountryLong) &&
            (identical(other.CountryShort, CountryShort) ||
                other.CountryShort == CountryShort) &&
            (identical(other.NumVpnSessions, NumVpnSessions) ||
                other.NumVpnSessions == NumVpnSessions) &&
            (identical(other.Uptime, Uptime) || other.Uptime == Uptime) &&
            (identical(other.TotalUsers, TotalUsers) ||
                other.TotalUsers == TotalUsers) &&
            (identical(other.TotalTraffic, TotalTraffic) ||
                other.TotalTraffic == TotalTraffic) &&
            (identical(other.LogType, LogType) || other.LogType == LogType) &&
            (identical(other.Operator, Operator) ||
                other.Operator == Operator) &&
            (identical(other.Message, Message) || other.Message == Message) &&
            (identical(other.OpenVPN_ConfigData_Base64,
                    OpenVPN_ConfigData_Base64) ||
                other.OpenVPN_ConfigData_Base64 == OpenVPN_ConfigData_Base64));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      HostName,
      IP,
      Score,
      Ping,
      Speed,
      CountryLong,
      CountryShort,
      NumVpnSessions,
      Uptime,
      TotalUsers,
      TotalTraffic,
      LogType,
      Operator,
      Message,
      OpenVPN_ConfigData_Base64);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VpnInfoModelImplCopyWith<_$VpnInfoModelImpl> get copyWith =>
      __$$VpnInfoModelImplCopyWithImpl<_$VpnInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VpnInfoModelImplToJson(
      this,
    );
  }
}

abstract class _VpnInfoModel implements VpnInfoModel {
  factory _VpnInfoModel(
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
      final String OpenVPN_ConfigData_Base64) = _$VpnInfoModelImpl;

  factory _VpnInfoModel.fromJson(Map<String, dynamic> json) =
      _$VpnInfoModelImpl.fromJson;

  @override
  String get HostName;
  @override
  String get IP;
  @override
  num get Score;
  @override
  num get Ping;
  @override
  num get Speed;
  @override
  String get CountryLong;
  @override
  String get CountryShort;
  @override
  num get NumVpnSessions;
  @override
  num get Uptime;
  @override
  num get TotalUsers;
  @override
  num get TotalTraffic;
  @override
  String get LogType;
  @override
  String get Operator;
  @override
  String get Message;
  @override
  String get OpenVPN_ConfigData_Base64;
  @override
  @JsonKey(ignore: true)
  _$$VpnInfoModelImplCopyWith<_$VpnInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
