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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  int get softIndex => throw _privateConstructorUsedError;
  set softIndex(int value) => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  set image(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createDate = null,
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
abstract class _$$_ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$$_ReminderCopyWith(
          _$_Reminder value, $Res Function(_$_Reminder) then) =
      __$$_ReminderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      @DateTimeConverter() DateTime createDate,
      int softIndex,
      String? image});
}

/// @nodoc
class __$$_ReminderCopyWithImpl<$Res>
    extends _$ReminderCopyWithImpl<$Res, _$_Reminder>
    implements _$$_ReminderCopyWith<$Res> {
  __$$_ReminderCopyWithImpl(
      _$_Reminder _value, $Res Function(_$_Reminder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createDate = null,
    Object? softIndex = null,
    Object? image = freezed,
  }) {
    return _then(_$_Reminder(
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
class _$_Reminder extends _Reminder {
  _$_Reminder(
      {this.id,
      required this.name,
      @DateTimeConverter() required this.createDate,
      this.softIndex = -1,
      this.image})
      : super._();

  factory _$_Reminder.fromJson(Map<String, dynamic> json) =>
      _$$_ReminderFromJson(json);

  @override
  int? id;
  @override
  String name;
  @override
  @DateTimeConverter()
  DateTime createDate;
  @override
  @JsonKey()
  int softIndex;
  @override
  String? image;

  @override
  String toString() {
    return 'Reminder(id: $id, name: $name, createDate: $createDate, softIndex: $softIndex, image: $image)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReminderCopyWith<_$_Reminder> get copyWith =>
      __$$_ReminderCopyWithImpl<_$_Reminder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReminderToJson(
      this,
    );
  }
}

abstract class _Reminder extends Reminder {
  factory _Reminder(
      {int? id,
      required String name,
      @DateTimeConverter() required DateTime createDate,
      int softIndex,
      String? image}) = _$_Reminder;
  _Reminder._() : super._();

  factory _Reminder.fromJson(Map<String, dynamic> json) = _$_Reminder.fromJson;

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
  int get softIndex;
  set softIndex(int value);
  @override
  String? get image;
  set image(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_ReminderCopyWith<_$_Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}
