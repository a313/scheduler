// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return _Reminder.fromJson(json);
}

/// @nodoc
mixin _$Reminder {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  set createDate(DateTime value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get remindDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  set remindDate(DateTime value) => throw _privateConstructorUsedError;
  AlertType get alert => throw _privateConstructorUsedError;
  set alert(AlertType value) => throw _privateConstructorUsedError;
  RepeatType get repeat => throw _privateConstructorUsedError;
  set repeat(RepeatType value) => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;
  set interval(int value) => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get time => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  set time(TimeOfDay? value) => throw _privateConstructorUsedError;
  int get softIndex => throw _privateConstructorUsedError;
  set softIndex(int value) => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  set image(String? value) => throw _privateConstructorUsedError;

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res, Reminder>;
  @useResult
  $Res call(
      {int? id,
      String name,
      @DateTimeConverter() DateTime createDate,
      @DateTimeConverter() DateTime remindDate,
      AlertType alert,
      RepeatType repeat,
      int interval,
      @TimeOfDayConverter() TimeOfDay? time,
      int softIndex,
      String? image});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res, $Val extends Reminder>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createDate = null,
    Object? remindDate = null,
    Object? alert = null,
    Object? repeat = null,
    Object? interval = null,
    Object? time = freezed,
    Object? softIndex = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remindDate: null == remindDate
          ? _value.remindDate
          : remindDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alert: null == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      softIndex: null == softIndex
          ? _value.softIndex
          : softIndex // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderImplCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$$ReminderImplCopyWith(
          _$ReminderImpl value, $Res Function(_$ReminderImpl) then) =
      __$$ReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      @DateTimeConverter() DateTime createDate,
      @DateTimeConverter() DateTime remindDate,
      AlertType alert,
      RepeatType repeat,
      int interval,
      @TimeOfDayConverter() TimeOfDay? time,
      int softIndex,
      String? image});
}

/// @nodoc
class __$$ReminderImplCopyWithImpl<$Res>
    extends _$ReminderCopyWithImpl<$Res, _$ReminderImpl>
    implements _$$ReminderImplCopyWith<$Res> {
  __$$ReminderImplCopyWithImpl(
      _$ReminderImpl _value, $Res Function(_$ReminderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createDate = null,
    Object? remindDate = null,
    Object? alert = null,
    Object? repeat = null,
    Object? interval = null,
    Object? time = freezed,
    Object? softIndex = null,
    Object? image = freezed,
  }) {
    return _then(_$ReminderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remindDate: null == remindDate
          ? _value.remindDate
          : remindDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alert: null == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      softIndex: null == softIndex
          ? _value.softIndex
          : softIndex // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderImpl extends _Reminder {
  _$ReminderImpl(
      {this.id,
      required this.name,
      @DateTimeConverter() required this.createDate,
      @DateTimeConverter() required this.remindDate,
      required this.alert,
      required this.repeat,
      this.interval = 1,
      @TimeOfDayConverter() this.time,
      this.softIndex = -1,
      this.image})
      : super._();

  factory _$ReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderImplFromJson(json);

  @override
  int? id;
  @override
  String name;
  @override
  @DateTimeConverter()
  DateTime createDate;
  @override
  @DateTimeConverter()
  DateTime remindDate;
  @override
  AlertType alert;
  @override
  RepeatType repeat;
  @override
  @JsonKey()
  int interval;
  @override
  @TimeOfDayConverter()
  TimeOfDay? time;
  @override
  @JsonKey()
  int softIndex;
  @override
  String? image;

  @override
  String toString() {
    return 'Reminder(id: $id, name: $name, createDate: $createDate, remindDate: $remindDate, alert: $alert, repeat: $repeat, interval: $interval, time: $time, softIndex: $softIndex, image: $image)';
  }

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      __$$ReminderImplCopyWithImpl<_$ReminderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderImplToJson(
      this,
    );
  }
}

abstract class _Reminder extends Reminder {
  factory _Reminder(
      {int? id,
      required String name,
      @DateTimeConverter() required DateTime createDate,
      @DateTimeConverter() required DateTime remindDate,
      required AlertType alert,
      required RepeatType repeat,
      int interval,
      @TimeOfDayConverter() TimeOfDay? time,
      int softIndex,
      String? image}) = _$ReminderImpl;
  _Reminder._() : super._();

  factory _Reminder.fromJson(Map<String, dynamic> json) =
      _$ReminderImpl.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  String get name;
  set name(String value);
  @override
  @DateTimeConverter()
  DateTime get createDate;
  @DateTimeConverter()
  set createDate(DateTime value);
  @override
  @DateTimeConverter()
  DateTime get remindDate;
  @DateTimeConverter()
  set remindDate(DateTime value);
  @override
  AlertType get alert;
  set alert(AlertType value);
  @override
  RepeatType get repeat;
  set repeat(RepeatType value);
  @override
  int get interval;
  set interval(int value);
  @override
  @TimeOfDayConverter()
  TimeOfDay? get time;
  @TimeOfDayConverter()
  set time(TimeOfDay? value);
  @override
  int get softIndex;
  set softIndex(int value);
  @override
  String? get image;
  set image(String? value);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
