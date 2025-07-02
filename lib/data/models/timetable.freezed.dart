// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Timetable {

@TimeOfDayConverter() TimeOfDay get begin;@TimeOfDayConverter() set begin(TimeOfDay value);@TimeOfDayConverter() TimeOfDay get end;@TimeOfDayConverter() set end(TimeOfDay value); int get dayInWeek; set dayInWeek(int value);
/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimetableCopyWith<Timetable> get copyWith => _$TimetableCopyWithImpl<Timetable>(this as Timetable, _$identity);

  /// Serializes this Timetable to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'Timetable(begin: $begin, end: $end, dayInWeek: $dayInWeek)';
}


}

/// @nodoc
abstract mixin class $TimetableCopyWith<$Res>  {
  factory $TimetableCopyWith(Timetable value, $Res Function(Timetable) _then) = _$TimetableCopyWithImpl;
@useResult
$Res call({
@TimeOfDayConverter() TimeOfDay begin,@TimeOfDayConverter() TimeOfDay end, int dayInWeek
});




}
/// @nodoc
class _$TimetableCopyWithImpl<$Res>
    implements $TimetableCopyWith<$Res> {
  _$TimetableCopyWithImpl(this._self, this._then);

  final Timetable _self;
  final $Res Function(Timetable) _then;

/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? begin = null,Object? end = null,Object? dayInWeek = null,}) {
  return _then(_self.copyWith(
begin: null == begin ? _self.begin : begin // ignore: cast_nullable_to_non_nullable
as TimeOfDay,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TimeOfDay,dayInWeek: null == dayInWeek ? _self.dayInWeek : dayInWeek // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Timetable extends Timetable {
   _Timetable({@TimeOfDayConverter() required this.begin, @TimeOfDayConverter() required this.end, required this.dayInWeek}): super._();
  factory _Timetable.fromJson(Map<String, dynamic> json) => _$TimetableFromJson(json);

@override@TimeOfDayConverter()  TimeOfDay begin;
@override@TimeOfDayConverter()  TimeOfDay end;
@override  int dayInWeek;

/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableCopyWith<_Timetable> get copyWith => __$TimetableCopyWithImpl<_Timetable>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimetableToJson(this, );
}



@override
String toString() {
  return 'Timetable(begin: $begin, end: $end, dayInWeek: $dayInWeek)';
}


}

/// @nodoc
abstract mixin class _$TimetableCopyWith<$Res> implements $TimetableCopyWith<$Res> {
  factory _$TimetableCopyWith(_Timetable value, $Res Function(_Timetable) _then) = __$TimetableCopyWithImpl;
@override @useResult
$Res call({
@TimeOfDayConverter() TimeOfDay begin,@TimeOfDayConverter() TimeOfDay end, int dayInWeek
});




}
/// @nodoc
class __$TimetableCopyWithImpl<$Res>
    implements _$TimetableCopyWith<$Res> {
  __$TimetableCopyWithImpl(this._self, this._then);

  final _Timetable _self;
  final $Res Function(_Timetable) _then;

/// Create a copy of Timetable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? begin = null,Object? end = null,Object? dayInWeek = null,}) {
  return _then(_Timetable(
begin: null == begin ? _self.begin : begin // ignore: cast_nullable_to_non_nullable
as TimeOfDay,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TimeOfDay,dayInWeek: null == dayInWeek ? _self.dayInWeek : dayInWeek // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
