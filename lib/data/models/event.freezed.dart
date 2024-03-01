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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  set parentId(int? value) => throw _privateConstructorUsedError;
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
  EventType get type => throw _privateConstructorUsedError;
  set type(EventType value) => throw _privateConstructorUsedError;
  AlertType get alert => throw _privateConstructorUsedError;
  set alert(AlertType value) => throw _privateConstructorUsedError;
  RepeatType get repeat => throw _privateConstructorUsedError;
  set repeat(RepeatType value) => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  set location(String? value) => throw _privateConstructorUsedError;
  int? get classId => throw _privateConstructorUsedError;
  set classId(int? value) => throw _privateConstructorUsedError;
  @ListIntConverter()
  List<int> get invitedIds => throw _privateConstructorUsedError;
  @ListIntConverter()
  set invitedIds(List<int> value) => throw _privateConstructorUsedError;
  @ListIntConverter()
  List<int> get joinedIds => throw _privateConstructorUsedError;
  @ListIntConverter()
  set joinedIds(List<int> value) => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get isActive => throw _privateConstructorUsedError;
  @BoolConverter()
  set isActive(bool value) => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  set note(String? value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<Student> get students => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set students(List<Student> value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  ClassRoom? get classRoom => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set classRoom(ClassRoom? value) => throw _privateConstructorUsedError;

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
      int? parentId,
      String name,
      @DateTimeConverter() DateTime startTime,
      @DateTimeConverter() DateTime endTime,
      EventType type,
      AlertType alert,
      RepeatType repeat,
      String? location,
      int? classId,
      @ListIntConverter() List<int> invitedIds,
      @ListIntConverter() List<int> joinedIds,
      @BoolConverter() bool isActive,
      String? note,
      @JsonKey(includeToJson: false, includeFromJson: false)
      List<Student> students,
      @JsonKey(includeToJson: false, includeFromJson: false)
      ClassRoom? classRoom});

  $ClassRoomCopyWith<$Res>? get classRoom;
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
    Object? parentId = freezed,
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? alert = null,
    Object? repeat = null,
    Object? location = freezed,
    Object? classId = freezed,
    Object? invitedIds = null,
    Object? joinedIds = null,
    Object? isActive = null,
    Object? note = freezed,
    Object? students = null,
    Object? classRoom = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
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
      classId: freezed == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int?,
      invitedIds: null == invitedIds
          ? _value.invitedIds
          : invitedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      joinedIds: null == joinedIds
          ? _value.joinedIds
          : joinedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
      classRoom: freezed == classRoom
          ? _value.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as ClassRoom?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassRoomCopyWith<$Res>? get classRoom {
    if (_value.classRoom == null) {
      return null;
    }

    return $ClassRoomCopyWith<$Res>(_value.classRoom!, (value) {
      return _then(_value.copyWith(classRoom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? parentId,
      String name,
      @DateTimeConverter() DateTime startTime,
      @DateTimeConverter() DateTime endTime,
      EventType type,
      AlertType alert,
      RepeatType repeat,
      String? location,
      int? classId,
      @ListIntConverter() List<int> invitedIds,
      @ListIntConverter() List<int> joinedIds,
      @BoolConverter() bool isActive,
      String? note,
      @JsonKey(includeToJson: false, includeFromJson: false)
      List<Student> students,
      @JsonKey(includeToJson: false, includeFromJson: false)
      ClassRoom? classRoom});

  @override
  $ClassRoomCopyWith<$Res>? get classRoom;
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? parentId = freezed,
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? alert = null,
    Object? repeat = null,
    Object? location = freezed,
    Object? classId = freezed,
    Object? invitedIds = null,
    Object? joinedIds = null,
    Object? isActive = null,
    Object? note = freezed,
    Object? students = null,
    Object? classRoom = freezed,
  }) {
    return _then(_$EventImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
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
      classId: freezed == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int?,
      invitedIds: null == invitedIds
          ? _value.invitedIds
          : invitedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      joinedIds: null == joinedIds
          ? _value.joinedIds
          : joinedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
      classRoom: freezed == classRoom
          ? _value.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as ClassRoom?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventImpl extends _Event with DiagnosticableTreeMixin {
  _$EventImpl(
      {this.id,
      this.parentId,
      required this.name,
      @DateTimeConverter() required this.startTime,
      @DateTimeConverter() required this.endTime,
      required this.type,
      required this.alert,
      required this.repeat,
      this.location,
      this.classId,
      @ListIntConverter() this.invitedIds = const [],
      @ListIntConverter() this.joinedIds = const [],
      @BoolConverter() this.isActive = true,
      this.note,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.students = const [],
      @JsonKey(includeToJson: false, includeFromJson: false) this.classRoom})
      : super._();

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  int? id;
  @override
  int? parentId;
  @override
  String name;
  @override
  @DateTimeConverter()
  DateTime startTime;
  @override
  @DateTimeConverter()
  DateTime endTime;
  @override
  EventType type;
  @override
  AlertType alert;
  @override
  RepeatType repeat;
  @override
  String? location;
  @override
  int? classId;
  @override
  @JsonKey()
  @ListIntConverter()
  List<int> invitedIds;
  @override
  @JsonKey()
  @ListIntConverter()
  List<int> joinedIds;
  @override
  @JsonKey()
  @BoolConverter()
  bool isActive;
  @override
  String? note;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<Student> students;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  ClassRoom? classRoom;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(id: $id, parentId: $parentId, name: $name, startTime: $startTime, endTime: $endTime, type: $type, alert: $alert, repeat: $repeat, location: $location, classId: $classId, invitedIds: $invitedIds, joinedIds: $joinedIds, isActive: $isActive, note: $note, students: $students, classRoom: $classRoom)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('alert', alert))
      ..add(DiagnosticsProperty('repeat', repeat))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('classId', classId))
      ..add(DiagnosticsProperty('invitedIds', invitedIds))
      ..add(DiagnosticsProperty('joinedIds', joinedIds))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('students', students))
      ..add(DiagnosticsProperty('classRoom', classRoom));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event extends Event {
  factory _Event(
      {int? id,
      int? parentId,
      required String name,
      @DateTimeConverter() required DateTime startTime,
      @DateTimeConverter() required DateTime endTime,
      required EventType type,
      required AlertType alert,
      required RepeatType repeat,
      String? location,
      int? classId,
      @ListIntConverter() List<int> invitedIds,
      @ListIntConverter() List<int> joinedIds,
      @BoolConverter() bool isActive,
      String? note,
      @JsonKey(includeToJson: false, includeFromJson: false)
      List<Student> students,
      @JsonKey(includeToJson: false, includeFromJson: false)
      ClassRoom? classRoom}) = _$EventImpl;
  _Event._() : super._();

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  int? get parentId;
  set parentId(int? value);
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
  EventType get type;
  set type(EventType value);
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
  int? get classId;
  set classId(int? value);
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
  @BoolConverter()
  bool get isActive;
  @BoolConverter()
  set isActive(bool value);
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
  ClassRoom? get classRoom;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set classRoom(ClassRoom? value);
  @override
  @JsonKey(ignore: true)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
