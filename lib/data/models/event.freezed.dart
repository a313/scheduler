// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get startTime => throw _privateConstructorUsedError;
  @DateTimeConverter()
  set startTime(DateTime value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get endTime => throw _privateConstructorUsedError;
  @DateTimeConverter()
  set endTime(DateTime value) => throw _privateConstructorUsedError;
  AlertType get alert => throw _privateConstructorUsedError;
  set alert(AlertType value) => throw _privateConstructorUsedError;
  RepeatType get repeat => throw _privateConstructorUsedError;
  set repeat(RepeatType value) => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  set location(String? value) => throw _privateConstructorUsedError;
  @ListIntConverter()
  List<int> get classIds => throw _privateConstructorUsedError;
  @ListIntConverter()
  set classIds(List<int> value) => throw _privateConstructorUsedError;
  @ListIntConverter()
  List<int> get invitedIds => throw _privateConstructorUsedError;
  @ListIntConverter()
  set invitedIds(List<int> value) => throw _privateConstructorUsedError;
  @ListIntConverter()
  List<int> get joinedIds => throw _privateConstructorUsedError;
  @ListIntConverter()
  set joinedIds(List<int> value) => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  set note(String? value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<Student> get students => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set students(List<Student> value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<ClassRoom> get classRooms => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set classRooms(List<ClassRoom> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {int? id,
      String name,
      @DateTimeConverter()
          DateTime startTime,
      @DateTimeConverter()
          DateTime endTime,
      AlertType alert,
      RepeatType repeat,
      String? location,
      @ListIntConverter()
          List<int> classIds,
      @ListIntConverter()
          List<int> invitedIds,
      @ListIntConverter()
          List<int> joinedIds,
      String? note,
      @JsonKey(includeToJson: false, includeFromJson: false)
          List<Student> students,
      @JsonKey(includeToJson: false, includeFromJson: false)
          List<ClassRoom> classRooms});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? alert = null,
    Object? repeat = null,
    Object? location = freezed,
    Object? classIds = null,
    Object? invitedIds = null,
    Object? joinedIds = null,
    Object? note = freezed,
    Object? students = null,
    Object? classRooms = null,
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
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alert: null == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      classIds: null == classIds
          ? _value.classIds
          : classIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      invitedIds: null == invitedIds
          ? _value.invitedIds
          : invitedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      joinedIds: null == joinedIds
          ? _value.joinedIds
          : joinedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
      classRooms: null == classRooms
          ? _value.classRooms
          : classRooms // ignore: cast_nullable_to_non_nullable
              as List<ClassRoom>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      @DateTimeConverter()
          DateTime startTime,
      @DateTimeConverter()
          DateTime endTime,
      AlertType alert,
      RepeatType repeat,
      String? location,
      @ListIntConverter()
          List<int> classIds,
      @ListIntConverter()
          List<int> invitedIds,
      @ListIntConverter()
          List<int> joinedIds,
      String? note,
      @JsonKey(includeToJson: false, includeFromJson: false)
          List<Student> students,
      @JsonKey(includeToJson: false, includeFromJson: false)
          List<ClassRoom> classRooms});
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? alert = null,
    Object? repeat = null,
    Object? location = freezed,
    Object? classIds = null,
    Object? invitedIds = null,
    Object? joinedIds = null,
    Object? note = freezed,
    Object? students = null,
    Object? classRooms = null,
  }) {
    return _then(_$_Event(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alert: null == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      classIds: null == classIds
          ? _value.classIds
          : classIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      invitedIds: null == invitedIds
          ? _value.invitedIds
          : invitedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      joinedIds: null == joinedIds
          ? _value.joinedIds
          : joinedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
      classRooms: null == classRooms
          ? _value.classRooms
          : classRooms // ignore: cast_nullable_to_non_nullable
              as List<ClassRoom>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event extends _Event {
  _$_Event(
      {this.id,
      required this.name,
      @DateTimeConverter()
          required this.startTime,
      @DateTimeConverter()
          required this.endTime,
      required this.alert,
      required this.repeat,
      this.location,
      @ListIntConverter()
          this.classIds = const [],
      @ListIntConverter()
          this.invitedIds = const [],
      @ListIntConverter()
          this.joinedIds = const [],
      this.note,
      @JsonKey(includeToJson: false, includeFromJson: false)
          this.students = const [],
      @JsonKey(includeToJson: false, includeFromJson: false)
          this.classRooms = const []})
      : super._();

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  int? id;
  @override
  String name;
  @override
  @DateTimeConverter()
  DateTime startTime;
  @override
  @DateTimeConverter()
  DateTime endTime;
  @override
  AlertType alert;
  @override
  RepeatType repeat;
  @override
  String? location;
  @override
  @JsonKey()
  @ListIntConverter()
  List<int> classIds;
  @override
  @JsonKey()
  @ListIntConverter()
  List<int> invitedIds;
  @override
  @JsonKey()
  @ListIntConverter()
  List<int> joinedIds;
  @override
  String? note;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<Student> students;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<ClassRoom> classRooms;

  @override
  String toString() {
    return 'Event(id: $id, name: $name, startTime: $startTime, endTime: $endTime, alert: $alert, repeat: $repeat, location: $location, classIds: $classIds, invitedIds: $invitedIds, joinedIds: $joinedIds, note: $note, students: $students, classRooms: $classRooms)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event extends Event {
  factory _Event(
      {int? id,
      required String name,
      @DateTimeConverter()
          required DateTime startTime,
      @DateTimeConverter()
          required DateTime endTime,
      required AlertType alert,
      required RepeatType repeat,
      String? location,
      @ListIntConverter()
          List<int> classIds,
      @ListIntConverter()
          List<int> invitedIds,
      @ListIntConverter()
          List<int> joinedIds,
      String? note,
      @JsonKey(includeToJson: false, includeFromJson: false)
          List<Student> students,
      @JsonKey(includeToJson: false, includeFromJson: false)
          List<ClassRoom> classRooms}) = _$_Event;
  _Event._() : super._();

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  String get name;
  set name(String value);
  @override
  @DateTimeConverter()
  DateTime get startTime;
  @DateTimeConverter()
  set startTime(DateTime value);
  @override
  @DateTimeConverter()
  DateTime get endTime;
  @DateTimeConverter()
  set endTime(DateTime value);
  @override
  AlertType get alert;
  set alert(AlertType value);
  @override
  RepeatType get repeat;
  set repeat(RepeatType value);
  @override
  String? get location;
  set location(String? value);
  @override
  @ListIntConverter()
  List<int> get classIds;
  @ListIntConverter()
  set classIds(List<int> value);
  @override
  @ListIntConverter()
  List<int> get invitedIds;
  @ListIntConverter()
  set invitedIds(List<int> value);
  @override
  @ListIntConverter()
  List<int> get joinedIds;
  @ListIntConverter()
  set joinedIds(List<int> value);
  @override
  String? get note;
  set note(String? value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<Student> get students;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set students(List<Student> value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<ClassRoom> get classRooms;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set classRooms(List<ClassRoom> value);
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
