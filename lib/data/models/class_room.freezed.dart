// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClassRoom implements DiagnosticableTreeMixin {
  int? get id;
  set id(int? value);
  String get name;
  set name(String value);
  @DateTimeConverter()
  DateTime get createDate;
  @DateTimeConverter()
  set createDate(DateTime value);
  @DateTimeConverter()
  DateTime get openDate;
  @DateTimeConverter()
  set openDate(DateTime value);
  int get tuition;
  set tuition(int value);
  AlertType get alert;
  set alert(AlertType value);
  String? get location;
  set location(String? value);
  @ListTimetableConverter()
  List<Timetable> get timetables;
  @ListTimetableConverter()
  set timetables(List<Timetable> value);
  @BoolConverter()
  bool get isOpen;
  @BoolConverter()
  set isOpen(bool value);
  int get softIndex;
  set softIndex(int value);
  String? get image;
  set image(String? value);

  /// Create a copy of ClassRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClassRoomCopyWith<ClassRoom> get copyWith =>
      _$ClassRoomCopyWithImpl<ClassRoom>(this as ClassRoom, _$identity);

  /// Serializes this ClassRoom to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ClassRoom'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createDate', createDate))
      ..add(DiagnosticsProperty('openDate', openDate))
      ..add(DiagnosticsProperty('tuition', tuition))
      ..add(DiagnosticsProperty('alert', alert))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('timetables', timetables))
      ..add(DiagnosticsProperty('isOpen', isOpen))
      ..add(DiagnosticsProperty('softIndex', softIndex))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClassRoom(id: $id, name: $name, createDate: $createDate, openDate: $openDate, tuition: $tuition, alert: $alert, location: $location, timetables: $timetables, isOpen: $isOpen, softIndex: $softIndex, image: $image)';
  }
}

/// @nodoc
abstract mixin class $ClassRoomCopyWith<$Res> {
  factory $ClassRoomCopyWith(ClassRoom value, $Res Function(ClassRoom) _then) =
      _$ClassRoomCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String name,
      @DateTimeConverter() DateTime createDate,
      @DateTimeConverter() DateTime openDate,
      int tuition,
      AlertType alert,
      String? location,
      @ListTimetableConverter() List<Timetable> timetables,
      @BoolConverter() bool isOpen,
      int softIndex,
      String? image});
}

/// @nodoc
class _$ClassRoomCopyWithImpl<$Res> implements $ClassRoomCopyWith<$Res> {
  _$ClassRoomCopyWithImpl(this._self, this._then);

  final ClassRoom _self;
  final $Res Function(ClassRoom) _then;

  /// Create a copy of ClassRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createDate = null,
    Object? openDate = null,
    Object? tuition = null,
    Object? alert = null,
    Object? location = freezed,
    Object? timetables = null,
    Object? isOpen = null,
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
      openDate: null == openDate
          ? _self.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tuition: null == tuition
          ? _self.tuition
          : tuition // ignore: cast_nullable_to_non_nullable
              as int,
      alert: null == alert
          ? _self.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      timetables: null == timetables
          ? _self.timetables
          : timetables // ignore: cast_nullable_to_non_nullable
              as List<Timetable>,
      isOpen: null == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _ClassRoom extends ClassRoom with DiagnosticableTreeMixin {
  _ClassRoom(
      {this.id,
      required this.name,
      @DateTimeConverter() required this.createDate,
      @DateTimeConverter() required this.openDate,
      required this.tuition,
      this.alert = AlertType.None,
      this.location,
      @ListTimetableConverter() this.timetables = const [],
      @BoolConverter() required this.isOpen,
      this.softIndex = -1,
      this.image})
      : super._();
  factory _ClassRoom.fromJson(Map<String, dynamic> json) =>
      _$ClassRoomFromJson(json);

  @override
  int? id;
  @override
  String name;
  @override
  @DateTimeConverter()
  DateTime createDate;
  @override
  @DateTimeConverter()
  DateTime openDate;
  @override
  int tuition;
  @override
  @JsonKey()
  AlertType alert;
  @override
  String? location;
  @override
  @JsonKey()
  @ListTimetableConverter()
  List<Timetable> timetables;
  @override
  @BoolConverter()
  bool isOpen;
  @override
  @JsonKey()
  int softIndex;
  @override
  String? image;

  /// Create a copy of ClassRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClassRoomCopyWith<_ClassRoom> get copyWith =>
      __$ClassRoomCopyWithImpl<_ClassRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClassRoomToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ClassRoom'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createDate', createDate))
      ..add(DiagnosticsProperty('openDate', openDate))
      ..add(DiagnosticsProperty('tuition', tuition))
      ..add(DiagnosticsProperty('alert', alert))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('timetables', timetables))
      ..add(DiagnosticsProperty('isOpen', isOpen))
      ..add(DiagnosticsProperty('softIndex', softIndex))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClassRoom(id: $id, name: $name, createDate: $createDate, openDate: $openDate, tuition: $tuition, alert: $alert, location: $location, timetables: $timetables, isOpen: $isOpen, softIndex: $softIndex, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$ClassRoomCopyWith<$Res>
    implements $ClassRoomCopyWith<$Res> {
  factory _$ClassRoomCopyWith(
          _ClassRoom value, $Res Function(_ClassRoom) _then) =
      __$ClassRoomCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      @DateTimeConverter() DateTime createDate,
      @DateTimeConverter() DateTime openDate,
      int tuition,
      AlertType alert,
      String? location,
      @ListTimetableConverter() List<Timetable> timetables,
      @BoolConverter() bool isOpen,
      int softIndex,
      String? image});
}

/// @nodoc
class __$ClassRoomCopyWithImpl<$Res> implements _$ClassRoomCopyWith<$Res> {
  __$ClassRoomCopyWithImpl(this._self, this._then);

  final _ClassRoom _self;
  final $Res Function(_ClassRoom) _then;

  /// Create a copy of ClassRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createDate = null,
    Object? openDate = null,
    Object? tuition = null,
    Object? alert = null,
    Object? location = freezed,
    Object? timetables = null,
    Object? isOpen = null,
    Object? softIndex = null,
    Object? image = freezed,
  }) {
    return _then(_ClassRoom(
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
      openDate: null == openDate
          ? _self.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tuition: null == tuition
          ? _self.tuition
          : tuition // ignore: cast_nullable_to_non_nullable
              as int,
      alert: null == alert
          ? _self.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      timetables: null == timetables
          ? _self.timetables
          : timetables // ignore: cast_nullable_to_non_nullable
              as List<Timetable>,
      isOpen: null == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
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
