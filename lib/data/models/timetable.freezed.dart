// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return _Timetable.fromJson(json);
}

/// @nodoc
mixin _$Timetable {
  @TimeOfDayConverter()
  TimeOfDay get begin => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  set begin(TimeOfDay value) => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get end => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  set end(TimeOfDay value) => throw _privateConstructorUsedError;
  int get dayInWeek => throw _privateConstructorUsedError;
  set dayInWeek(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableCopyWith<Timetable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableCopyWith<$Res> {
  factory $TimetableCopyWith(Timetable value, $Res Function(Timetable) then) =
      _$TimetableCopyWithImpl<$Res, Timetable>;
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay begin,
      @TimeOfDayConverter() TimeOfDay end,
      int dayInWeek});
}

/// @nodoc
class _$TimetableCopyWithImpl<$Res, $Val extends Timetable>
    implements $TimetableCopyWith<$Res> {
  _$TimetableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? begin = null,
    Object? end = null,
    Object? dayInWeek = null,
  }) {
    return _then(_value.copyWith(
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      dayInWeek: null == dayInWeek
          ? _value.dayInWeek
          : dayInWeek // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimetableCopyWith<$Res> implements $TimetableCopyWith<$Res> {
  factory _$$_TimetableCopyWith(
          _$_Timetable value, $Res Function(_$_Timetable) then) =
      __$$_TimetableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay begin,
      @TimeOfDayConverter() TimeOfDay end,
      int dayInWeek});
}

/// @nodoc
class __$$_TimetableCopyWithImpl<$Res>
    extends _$TimetableCopyWithImpl<$Res, _$_Timetable>
    implements _$$_TimetableCopyWith<$Res> {
  __$$_TimetableCopyWithImpl(
      _$_Timetable _value, $Res Function(_$_Timetable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? begin = null,
    Object? end = null,
    Object? dayInWeek = null,
  }) {
    return _then(_$_Timetable(
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      dayInWeek: null == dayInWeek
          ? _value.dayInWeek
          : dayInWeek // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Timetable extends _Timetable {
  _$_Timetable(
      {@TimeOfDayConverter() required this.begin,
      @TimeOfDayConverter() required this.end,
      required this.dayInWeek})
      : super._();

  factory _$_Timetable.fromJson(Map<String, dynamic> json) =>
      _$$_TimetableFromJson(json);

  @override
  @TimeOfDayConverter()
  TimeOfDay begin;
  @override
  @TimeOfDayConverter()
  TimeOfDay end;
  @override
  int dayInWeek;

  @override
  String toString() {
    return 'Timetable(begin: $begin, end: $end, dayInWeek: $dayInWeek)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimetableCopyWith<_$_Timetable> get copyWith =>
      __$$_TimetableCopyWithImpl<_$_Timetable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimetableToJson(
      this,
    );
  }
}

abstract class _Timetable extends Timetable {
  factory _Timetable(
      {@TimeOfDayConverter() required TimeOfDay begin,
      @TimeOfDayConverter() required TimeOfDay end,
      required int dayInWeek}) = _$_Timetable;
  _Timetable._() : super._();

  factory _Timetable.fromJson(Map<String, dynamic> json) =
      _$_Timetable.fromJson;

  @override
  @TimeOfDayConverter()
  TimeOfDay get begin;
  @TimeOfDayConverter()
  set begin(TimeOfDay value);
  @override
  @TimeOfDayConverter()
  TimeOfDay get end;
  @TimeOfDayConverter()
  set end(TimeOfDay value);
  @override
  int get dayInWeek;
  set dayInWeek(int value);
  @override
  @JsonKey(ignore: true)
  _$$_TimetableCopyWith<_$_Timetable> get copyWith =>
      throw _privateConstructorUsedError;
}
