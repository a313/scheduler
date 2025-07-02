// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'y2_mate_video_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Y2MateVideoDetail {

 String get status; String get mess; String get page; String get vid; String get extractor; String get title; int get t; String get a; Links get links;
/// Create a copy of Y2MateVideoDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Y2MateVideoDetailCopyWith<Y2MateVideoDetail> get copyWith => _$Y2MateVideoDetailCopyWithImpl<Y2MateVideoDetail>(this as Y2MateVideoDetail, _$identity);

  /// Serializes this Y2MateVideoDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Y2MateVideoDetail&&(identical(other.status, status) || other.status == status)&&(identical(other.mess, mess) || other.mess == mess)&&(identical(other.page, page) || other.page == page)&&(identical(other.vid, vid) || other.vid == vid)&&(identical(other.extractor, extractor) || other.extractor == extractor)&&(identical(other.title, title) || other.title == title)&&(identical(other.t, t) || other.t == t)&&(identical(other.a, a) || other.a == a)&&(identical(other.links, links) || other.links == links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,mess,page,vid,extractor,title,t,a,links);

@override
String toString() {
  return 'Y2MateVideoDetail(status: $status, mess: $mess, page: $page, vid: $vid, extractor: $extractor, title: $title, t: $t, a: $a, links: $links)';
}


}

/// @nodoc
abstract mixin class $Y2MateVideoDetailCopyWith<$Res>  {
  factory $Y2MateVideoDetailCopyWith(Y2MateVideoDetail value, $Res Function(Y2MateVideoDetail) _then) = _$Y2MateVideoDetailCopyWithImpl;
@useResult
$Res call({
 String status, String mess, String page, String vid, String extractor, String title, int t, String a, Links links
});


$LinksCopyWith<$Res> get links;

}
/// @nodoc
class _$Y2MateVideoDetailCopyWithImpl<$Res>
    implements $Y2MateVideoDetailCopyWith<$Res> {
  _$Y2MateVideoDetailCopyWithImpl(this._self, this._then);

  final Y2MateVideoDetail _self;
  final $Res Function(Y2MateVideoDetail) _then;

/// Create a copy of Y2MateVideoDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? mess = null,Object? page = null,Object? vid = null,Object? extractor = null,Object? title = null,Object? t = null,Object? a = null,Object? links = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,mess: null == mess ? _self.mess : mess // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as String,vid: null == vid ? _self.vid : vid // ignore: cast_nullable_to_non_nullable
as String,extractor: null == extractor ? _self.extractor : extractor // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,t: null == t ? _self.t : t // ignore: cast_nullable_to_non_nullable
as int,a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as Links,
  ));
}
/// Create a copy of Y2MateVideoDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LinksCopyWith<$Res> get links {
  
  return $LinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Y2MateVideoDetail implements Y2MateVideoDetail {
  const _Y2MateVideoDetail({required this.status, required this.mess, required this.page, required this.vid, required this.extractor, required this.title, required this.t, required this.a, required this.links});
  factory _Y2MateVideoDetail.fromJson(Map<String, dynamic> json) => _$Y2MateVideoDetailFromJson(json);

@override final  String status;
@override final  String mess;
@override final  String page;
@override final  String vid;
@override final  String extractor;
@override final  String title;
@override final  int t;
@override final  String a;
@override final  Links links;

/// Create a copy of Y2MateVideoDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Y2MateVideoDetailCopyWith<_Y2MateVideoDetail> get copyWith => __$Y2MateVideoDetailCopyWithImpl<_Y2MateVideoDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Y2MateVideoDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Y2MateVideoDetail&&(identical(other.status, status) || other.status == status)&&(identical(other.mess, mess) || other.mess == mess)&&(identical(other.page, page) || other.page == page)&&(identical(other.vid, vid) || other.vid == vid)&&(identical(other.extractor, extractor) || other.extractor == extractor)&&(identical(other.title, title) || other.title == title)&&(identical(other.t, t) || other.t == t)&&(identical(other.a, a) || other.a == a)&&(identical(other.links, links) || other.links == links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,mess,page,vid,extractor,title,t,a,links);

@override
String toString() {
  return 'Y2MateVideoDetail(status: $status, mess: $mess, page: $page, vid: $vid, extractor: $extractor, title: $title, t: $t, a: $a, links: $links)';
}


}

/// @nodoc
abstract mixin class _$Y2MateVideoDetailCopyWith<$Res> implements $Y2MateVideoDetailCopyWith<$Res> {
  factory _$Y2MateVideoDetailCopyWith(_Y2MateVideoDetail value, $Res Function(_Y2MateVideoDetail) _then) = __$Y2MateVideoDetailCopyWithImpl;
@override @useResult
$Res call({
 String status, String mess, String page, String vid, String extractor, String title, int t, String a, Links links
});


@override $LinksCopyWith<$Res> get links;

}
/// @nodoc
class __$Y2MateVideoDetailCopyWithImpl<$Res>
    implements _$Y2MateVideoDetailCopyWith<$Res> {
  __$Y2MateVideoDetailCopyWithImpl(this._self, this._then);

  final _Y2MateVideoDetail _self;
  final $Res Function(_Y2MateVideoDetail) _then;

/// Create a copy of Y2MateVideoDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? mess = null,Object? page = null,Object? vid = null,Object? extractor = null,Object? title = null,Object? t = null,Object? a = null,Object? links = null,}) {
  return _then(_Y2MateVideoDetail(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,mess: null == mess ? _self.mess : mess // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as String,vid: null == vid ? _self.vid : vid // ignore: cast_nullable_to_non_nullable
as String,extractor: null == extractor ? _self.extractor : extractor // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,t: null == t ? _self.t : t // ignore: cast_nullable_to_non_nullable
as int,a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as Links,
  ));
}

/// Create a copy of Y2MateVideoDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LinksCopyWith<$Res> get links {
  
  return $LinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// @nodoc
mixin _$Links {

 Map<String, ItemDetail>? get mp4; Map<String, ItemDetail>? get mp3; Map<String, ItemDetail>? get other;
/// Create a copy of Links
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinksCopyWith<Links> get copyWith => _$LinksCopyWithImpl<Links>(this as Links, _$identity);

  /// Serializes this Links to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Links&&const DeepCollectionEquality().equals(other.mp4, mp4)&&const DeepCollectionEquality().equals(other.mp3, mp3)&&const DeepCollectionEquality().equals(other.other, this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(mp4),const DeepCollectionEquality().hash(mp3),const DeepCollectionEquality().hash(other));

@override
String toString() {
  return 'Links(mp4: $mp4, mp3: $mp3, other: $other)';
}


}

/// @nodoc
abstract mixin class $LinksCopyWith<$Res>  {
  factory $LinksCopyWith(Links value, $Res Function(Links) _then) = _$LinksCopyWithImpl;
@useResult
$Res call({
 Map<String, ItemDetail>? mp4, Map<String, ItemDetail>? mp3, Map<String, ItemDetail>? other
});




}
/// @nodoc
class _$LinksCopyWithImpl<$Res>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._self, this._then);

  final Links _self;
  final $Res Function(Links) _then;

/// Create a copy of Links
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mp4 = freezed,Object? mp3 = freezed,Object? other = freezed,}) {
  return _then(_self.copyWith(
mp4: freezed == mp4 ? _self.mp4 : mp4 // ignore: cast_nullable_to_non_nullable
as Map<String, ItemDetail>?,mp3: freezed == mp3 ? _self.mp3 : mp3 // ignore: cast_nullable_to_non_nullable
as Map<String, ItemDetail>?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as Map<String, ItemDetail>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Links implements Links {
  const _Links({final  Map<String, ItemDetail>? mp4, final  Map<String, ItemDetail>? mp3, final  Map<String, ItemDetail>? other}): _mp4 = mp4,_mp3 = mp3,_other = other;
  factory _Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

 final  Map<String, ItemDetail>? _mp4;
@override Map<String, ItemDetail>? get mp4 {
  final value = _mp4;
  if (value == null) return null;
  if (_mp4 is EqualUnmodifiableMapView) return _mp4;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, ItemDetail>? _mp3;
@override Map<String, ItemDetail>? get mp3 {
  final value = _mp3;
  if (value == null) return null;
  if (_mp3 is EqualUnmodifiableMapView) return _mp3;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, ItemDetail>? _other;
@override Map<String, ItemDetail>? get other {
  final value = _other;
  if (value == null) return null;
  if (_other is EqualUnmodifiableMapView) return _other;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Links
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinksCopyWith<_Links> get copyWith => __$LinksCopyWithImpl<_Links>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Links&&const DeepCollectionEquality().equals(other._mp4, _mp4)&&const DeepCollectionEquality().equals(other._mp3, _mp3)&&const DeepCollectionEquality().equals(other._other, this._other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_mp4),const DeepCollectionEquality().hash(_mp3),const DeepCollectionEquality().hash(_other));

@override
String toString() {
  return 'Links(mp4: $mp4, mp3: $mp3, other: $other)';
}


}

/// @nodoc
abstract mixin class _$LinksCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$LinksCopyWith(_Links value, $Res Function(_Links) _then) = __$LinksCopyWithImpl;
@override @useResult
$Res call({
 Map<String, ItemDetail>? mp4, Map<String, ItemDetail>? mp3, Map<String, ItemDetail>? other
});




}
/// @nodoc
class __$LinksCopyWithImpl<$Res>
    implements _$LinksCopyWith<$Res> {
  __$LinksCopyWithImpl(this._self, this._then);

  final _Links _self;
  final $Res Function(_Links) _then;

/// Create a copy of Links
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mp4 = freezed,Object? mp3 = freezed,Object? other = freezed,}) {
  return _then(_Links(
mp4: freezed == mp4 ? _self._mp4 : mp4 // ignore: cast_nullable_to_non_nullable
as Map<String, ItemDetail>?,mp3: freezed == mp3 ? _self._mp3 : mp3 // ignore: cast_nullable_to_non_nullable
as Map<String, ItemDetail>?,other: freezed == other ? _self._other : other // ignore: cast_nullable_to_non_nullable
as Map<String, ItemDetail>?,
  ));
}


}


/// @nodoc
mixin _$ItemDetail {

 String get size; String get f; String get q; String get k;
/// Create a copy of ItemDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemDetailCopyWith<ItemDetail> get copyWith => _$ItemDetailCopyWithImpl<ItemDetail>(this as ItemDetail, _$identity);

  /// Serializes this ItemDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemDetail&&(identical(other.size, size) || other.size == size)&&(identical(other.f, f) || other.f == f)&&(identical(other.q, q) || other.q == q)&&(identical(other.k, k) || other.k == k));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,f,q,k);

@override
String toString() {
  return 'ItemDetail(size: $size, f: $f, q: $q, k: $k)';
}


}

/// @nodoc
abstract mixin class $ItemDetailCopyWith<$Res>  {
  factory $ItemDetailCopyWith(ItemDetail value, $Res Function(ItemDetail) _then) = _$ItemDetailCopyWithImpl;
@useResult
$Res call({
 String size, String f, String q, String k
});




}
/// @nodoc
class _$ItemDetailCopyWithImpl<$Res>
    implements $ItemDetailCopyWith<$Res> {
  _$ItemDetailCopyWithImpl(this._self, this._then);

  final ItemDetail _self;
  final $Res Function(ItemDetail) _then;

/// Create a copy of ItemDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? f = null,Object? q = null,Object? k = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,f: null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as String,q: null == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String,k: null == k ? _self.k : k // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ItemDetail implements ItemDetail {
  const _ItemDetail({required this.size, required this.f, required this.q, required this.k});
  factory _ItemDetail.fromJson(Map<String, dynamic> json) => _$ItemDetailFromJson(json);

@override final  String size;
@override final  String f;
@override final  String q;
@override final  String k;

/// Create a copy of ItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemDetailCopyWith<_ItemDetail> get copyWith => __$ItemDetailCopyWithImpl<_ItemDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemDetail&&(identical(other.size, size) || other.size == size)&&(identical(other.f, f) || other.f == f)&&(identical(other.q, q) || other.q == q)&&(identical(other.k, k) || other.k == k));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,f,q,k);

@override
String toString() {
  return 'ItemDetail(size: $size, f: $f, q: $q, k: $k)';
}


}

/// @nodoc
abstract mixin class _$ItemDetailCopyWith<$Res> implements $ItemDetailCopyWith<$Res> {
  factory _$ItemDetailCopyWith(_ItemDetail value, $Res Function(_ItemDetail) _then) = __$ItemDetailCopyWithImpl;
@override @useResult
$Res call({
 String size, String f, String q, String k
});




}
/// @nodoc
class __$ItemDetailCopyWithImpl<$Res>
    implements _$ItemDetailCopyWith<$Res> {
  __$ItemDetailCopyWithImpl(this._self, this._then);

  final _ItemDetail _self;
  final $Res Function(_ItemDetail) _then;

/// Create a copy of ItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? f = null,Object? q = null,Object? k = null,}) {
  return _then(_ItemDetail(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,f: null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as String,q: null == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String,k: null == k ? _self.k : k // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
