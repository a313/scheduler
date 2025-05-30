// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reminder {
  int? get id;
  set id(int? value);
  String get name;
  set name(String value);
  @DateTimeConverter()
  DateTime get createDate;
  @DateTimeConverter()
  set createDate(DateTime value);
  @DateTimeConverter()
  DateTime get remindDate;
  @DateTimeConverter()
  set remindDate(DateTime value);
  AlertType get alert;
  set alert(AlertType value);
  RepeatType get repeat;
  set repeat(RepeatType value);
  int get interval;
  set interval(int value);
  @TimeOfDayConverter()
  TimeOfDay? get time;
  @TimeOfDayConverter()
  set time(TimeOfDay? value);
  int get softIndex;
  set softIndex(int value);
  String? get image;
  set image(String? value);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReminderCopyWith<Reminder> get copyWith =>
      _$ReminderCopyWithImpl<Reminder>(this as Reminder, _$identity);

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return 'Reminder(id: $id, name: $name, createDate: $createDate, remindDate: $remindDate, alert: $alert, repeat: $repeat, interval: $interval, time: $time, softIndex: $softIndex, image: $image)';
  }
}

/// @nodoc
abstract mixin class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) _then) =
      _$ReminderCopyWithImpl;
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
class _$ReminderCopyWithImpl<$Res> implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._self, this._then);

  final Reminder _self;
  final $Res Function(Reminder) _then;

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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remindDate: null == remindDate
          ? _self.remindDate
          : remindDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alert: null == alert
          ? _self.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      repeat: null == repeat
          ? _self.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      interval: null == interval
          ? _self.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      softIndex: null == softIndex
          ? _self.softIndex
          : softIndex // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Reminder extends Reminder {
  _Reminder(
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
  factory _Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);

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

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReminderCopyWith<_Reminder> get copyWith =>
      __$ReminderCopyWithImpl<_Reminder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReminderToJson(
      this,
    );
  }

  @override
  String toString() {
    return 'Reminder(id: $id, name: $name, createDate: $createDate, remindDate: $remindDate, alert: $alert, repeat: $repeat, interval: $interval, time: $time, softIndex: $softIndex, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$ReminderCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) _then) =
      __$ReminderCopyWithImpl;
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
class __$ReminderCopyWithImpl<$Res> implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(this._self, this._then);

  final _Reminder _self;
  final $Res Function(_Reminder) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Reminder(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remindDate: null == remindDate
          ? _self.remindDate
          : remindDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alert: null == alert
          ? _self.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      repeat: null == repeat
          ? _self.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      interval: null == interval
          ? _self.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      softIndex: null == softIndex
          ? _self.softIndex
          : softIndex // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
