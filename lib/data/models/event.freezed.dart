// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Event implements DiagnosticableTreeMixin {
  int? get id;
  set id(int? value);
  int? get parentId;
  set parentId(int? value);
  String get name;
  set name(String value);
  @DateTimeConverter()
  DateTime get startTime;
  @DateTimeConverter()
  set startTime(DateTime value);
  @DateTimeConverter()
  DateTime get endTime;
  @DateTimeConverter()
  set endTime(DateTime value);
  EventType get type;
  set type(EventType value);
  AlertType get alert;
  set alert(AlertType value);
  RepeatType get repeat;
  set repeat(RepeatType value);
  String? get location;
  set location(String? value);
  int? get classId;
  set classId(int? value);
  @ListIntConverter()
  List<int> get invitedIds;
  @ListIntConverter()
  set invitedIds(List<int> value);
  @ListIntConverter()
  List<int> get joinedIds;
  @ListIntConverter()
  set joinedIds(List<int> value);
  @BoolConverter()
  bool get isActive;
  @BoolConverter()
  set isActive(bool value);
  String? get note;
  set note(String? value);
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<Student> get students;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set students(List<Student> value);
  @JsonKey(includeToJson: false, includeFromJson: false)
  ClassRoom? get classRoom;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set classRoom(ClassRoom? value);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventCopyWith<Event> get copyWith =>
      _$EventCopyWithImpl<Event>(this as Event, _$identity);

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(id: $id, parentId: $parentId, name: $name, startTime: $startTime, endTime: $endTime, type: $type, alert: $alert, repeat: $repeat, location: $location, classId: $classId, invitedIds: $invitedIds, joinedIds: $joinedIds, isActive: $isActive, note: $note, students: $students, classRoom: $classRoom)';
  }
}

/// @nodoc
abstract mixin class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) =
      _$EventCopyWithImpl;
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
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      alert: null == alert
          ? _self.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      repeat: null == repeat
          ? _self.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      classId: freezed == classId
          ? _self.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int?,
      invitedIds: null == invitedIds
          ? _self.invitedIds
          : invitedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      joinedIds: null == joinedIds
          ? _self.joinedIds
          : joinedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      students: null == students
          ? _self.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
      classRoom: freezed == classRoom
          ? _self.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as ClassRoom?,
    ));
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassRoomCopyWith<$Res>? get classRoom {
    if (_self.classRoom == null) {
      return null;
    }

    return $ClassRoomCopyWith<$Res>(_self.classRoom!, (value) {
      return _then(_self.copyWith(classRoom: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Event extends Event with DiagnosticableTreeMixin {
  _Event(
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
  factory _Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

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

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(id: $id, parentId: $parentId, name: $name, startTime: $startTime, endTime: $endTime, type: $type, alert: $alert, repeat: $repeat, location: $location, classId: $classId, invitedIds: $invitedIds, joinedIds: $joinedIds, isActive: $isActive, note: $note, students: $students, classRoom: $classRoom)';
  }
}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) =
      __$EventCopyWithImpl;
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
class __$EventCopyWithImpl<$Res> implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Event(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      alert: null == alert
          ? _self.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      repeat: null == repeat
          ? _self.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      classId: freezed == classId
          ? _self.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int?,
      invitedIds: null == invitedIds
          ? _self.invitedIds
          : invitedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      joinedIds: null == joinedIds
          ? _self.joinedIds
          : joinedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      students: null == students
          ? _self.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
      classRoom: freezed == classRoom
          ? _self.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as ClassRoom?,
    ));
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassRoomCopyWith<$Res>? get classRoom {
    if (_self.classRoom == null) {
      return null;
    }

    return $ClassRoomCopyWith<$Res>(_self.classRoom!, (value) {
      return _then(_self.copyWith(classRoom: value));
    });
  }
}

// dart format on
