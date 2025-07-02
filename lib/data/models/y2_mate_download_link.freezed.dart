// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'y2_mate_download_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Y2MateDownloadLink {

 String get status; String get mess;@JsonKey(name: 'c_status') String get cStatus; String get vid; String get title; String get ftype; String get fquality; String get dlink;
/// Create a copy of Y2MateDownloadLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Y2MateDownloadLinkCopyWith<Y2MateDownloadLink> get copyWith => _$Y2MateDownloadLinkCopyWithImpl<Y2MateDownloadLink>(this as Y2MateDownloadLink, _$identity);

  /// Serializes this Y2MateDownloadLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Y2MateDownloadLink&&(identical(other.status, status) || other.status == status)&&(identical(other.mess, mess) || other.mess == mess)&&(identical(other.cStatus, cStatus) || other.cStatus == cStatus)&&(identical(other.vid, vid) || other.vid == vid)&&(identical(other.title, title) || other.title == title)&&(identical(other.ftype, ftype) || other.ftype == ftype)&&(identical(other.fquality, fquality) || other.fquality == fquality)&&(identical(other.dlink, dlink) || other.dlink == dlink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,mess,cStatus,vid,title,ftype,fquality,dlink);

@override
String toString() {
  return 'Y2MateDownloadLink(status: $status, mess: $mess, cStatus: $cStatus, vid: $vid, title: $title, ftype: $ftype, fquality: $fquality, dlink: $dlink)';
}


}

/// @nodoc
abstract mixin class $Y2MateDownloadLinkCopyWith<$Res>  {
  factory $Y2MateDownloadLinkCopyWith(Y2MateDownloadLink value, $Res Function(Y2MateDownloadLink) _then) = _$Y2MateDownloadLinkCopyWithImpl;
@useResult
$Res call({
 String status, String mess,@JsonKey(name: 'c_status') String cStatus, String vid, String title, String ftype, String fquality, String dlink
});




}
/// @nodoc
class _$Y2MateDownloadLinkCopyWithImpl<$Res>
    implements $Y2MateDownloadLinkCopyWith<$Res> {
  _$Y2MateDownloadLinkCopyWithImpl(this._self, this._then);

  final Y2MateDownloadLink _self;
  final $Res Function(Y2MateDownloadLink) _then;

/// Create a copy of Y2MateDownloadLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? mess = null,Object? cStatus = null,Object? vid = null,Object? title = null,Object? ftype = null,Object? fquality = null,Object? dlink = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,mess: null == mess ? _self.mess : mess // ignore: cast_nullable_to_non_nullable
as String,cStatus: null == cStatus ? _self.cStatus : cStatus // ignore: cast_nullable_to_non_nullable
as String,vid: null == vid ? _self.vid : vid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ftype: null == ftype ? _self.ftype : ftype // ignore: cast_nullable_to_non_nullable
as String,fquality: null == fquality ? _self.fquality : fquality // ignore: cast_nullable_to_non_nullable
as String,dlink: null == dlink ? _self.dlink : dlink // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Y2MateDownloadLink implements Y2MateDownloadLink {
  const _Y2MateDownloadLink({required this.status, required this.mess, @JsonKey(name: 'c_status') required this.cStatus, required this.vid, required this.title, required this.ftype, required this.fquality, required this.dlink});
  factory _Y2MateDownloadLink.fromJson(Map<String, dynamic> json) => _$Y2MateDownloadLinkFromJson(json);

@override final  String status;
@override final  String mess;
@override@JsonKey(name: 'c_status') final  String cStatus;
@override final  String vid;
@override final  String title;
@override final  String ftype;
@override final  String fquality;
@override final  String dlink;

/// Create a copy of Y2MateDownloadLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Y2MateDownloadLinkCopyWith<_Y2MateDownloadLink> get copyWith => __$Y2MateDownloadLinkCopyWithImpl<_Y2MateDownloadLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Y2MateDownloadLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Y2MateDownloadLink&&(identical(other.status, status) || other.status == status)&&(identical(other.mess, mess) || other.mess == mess)&&(identical(other.cStatus, cStatus) || other.cStatus == cStatus)&&(identical(other.vid, vid) || other.vid == vid)&&(identical(other.title, title) || other.title == title)&&(identical(other.ftype, ftype) || other.ftype == ftype)&&(identical(other.fquality, fquality) || other.fquality == fquality)&&(identical(other.dlink, dlink) || other.dlink == dlink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,mess,cStatus,vid,title,ftype,fquality,dlink);

@override
String toString() {
  return 'Y2MateDownloadLink(status: $status, mess: $mess, cStatus: $cStatus, vid: $vid, title: $title, ftype: $ftype, fquality: $fquality, dlink: $dlink)';
}


}

/// @nodoc
abstract mixin class _$Y2MateDownloadLinkCopyWith<$Res> implements $Y2MateDownloadLinkCopyWith<$Res> {
  factory _$Y2MateDownloadLinkCopyWith(_Y2MateDownloadLink value, $Res Function(_Y2MateDownloadLink) _then) = __$Y2MateDownloadLinkCopyWithImpl;
@override @useResult
$Res call({
 String status, String mess,@JsonKey(name: 'c_status') String cStatus, String vid, String title, String ftype, String fquality, String dlink
});




}
/// @nodoc
class __$Y2MateDownloadLinkCopyWithImpl<$Res>
    implements _$Y2MateDownloadLinkCopyWith<$Res> {
  __$Y2MateDownloadLinkCopyWithImpl(this._self, this._then);

  final _Y2MateDownloadLink _self;
  final $Res Function(_Y2MateDownloadLink) _then;

/// Create a copy of Y2MateDownloadLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? mess = null,Object? cStatus = null,Object? vid = null,Object? title = null,Object? ftype = null,Object? fquality = null,Object? dlink = null,}) {
  return _then(_Y2MateDownloadLink(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,mess: null == mess ? _self.mess : mess // ignore: cast_nullable_to_non_nullable
as String,cStatus: null == cStatus ? _self.cStatus : cStatus // ignore: cast_nullable_to_non_nullable
as String,vid: null == vid ? _self.vid : vid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ftype: null == ftype ? _self.ftype : ftype // ignore: cast_nullable_to_non_nullable
as String,fquality: null == fquality ? _self.fquality : fquality // ignore: cast_nullable_to_non_nullable
as String,dlink: null == dlink ? _self.dlink : dlink // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
