// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassRoom _$ClassRoomFromJson(Map<String, dynamic> json) {
  return _ClassRoom.fromJson(json);
}

/// @nodoc
mixin _$ClassRoom {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  set createDate(DateTime value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get openDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  set openDate(DateTime value) => throw _privateConstructorUsedError;
  int get tuition => throw _privateConstructorUsedError;
  set tuition(int value) => throw _privateConstructorUsedError;
  AlertType get alert => throw _privateConstructorUsedError;
  set alert(AlertType value) => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  set location(String? value) => throw _privateConstructorUsedError;
  @ListTimetableConverter()
  List<Timetable> get timetables => throw _privateConstructorUsedError;
  @ListTimetableConverter()
  set timetables(List<Timetable> value) => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get isOpen => throw _privateConstructorUsedError;
  @BoolConverter()
  set isOpen(bool value) => throw _privateConstructorUsedError;
  int get softIndex => throw _privateConstructorUsedError;
  set softIndex(int value) => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  set image(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassRoomCopyWith<ClassRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassRoomCopyWith<$Res> {
  factory $ClassRoomCopyWith(ClassRoom value, $Res Function(ClassRoom) then) =
      _$ClassRoomCopyWithImpl<$Res, ClassRoom>;
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
class _$ClassRoomCopyWithImpl<$Res, $Val extends ClassRoom>
    implements $ClassRoomCopyWith<$Res> {
  _$ClassRoomCopyWithImpl(this._value, this._then);

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
    Object? openDate = null,
    Object? tuition = null,
    Object? alert = null,
    Object? location = freezed,
    Object? timetables = null,
    Object? isOpen = null,
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
      openDate: null == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tuition: null == tuition
          ? _value.tuition
          : tuition // ignore: cast_nullable_to_non_nullable
              as int,
      alert: null == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      timetables: null == timetables
          ? _value.timetables
          : timetables // ignore: cast_nullable_to_non_nullable
              as List<Timetable>,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$ClassRoomImplCopyWith<$Res>
    implements $ClassRoomCopyWith<$Res> {
  factory _$$ClassRoomImplCopyWith(
          _$ClassRoomImpl value, $Res Function(_$ClassRoomImpl) then) =
      __$$ClassRoomImplCopyWithImpl<$Res>;
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
class __$$ClassRoomImplCopyWithImpl<$Res>
    extends _$ClassRoomCopyWithImpl<$Res, _$ClassRoomImpl>
    implements _$$ClassRoomImplCopyWith<$Res> {
  __$$ClassRoomImplCopyWithImpl(
      _$ClassRoomImpl _value, $Res Function(_$ClassRoomImpl) _then)
      : super(_value, _then);

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
    return _then(_$ClassRoomImpl(
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
      openDate: null == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tuition: null == tuition
          ? _value.tuition
          : tuition // ignore: cast_nullable_to_non_nullable
              as int,
      alert: null == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertType,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      timetables: null == timetables
          ? _value.timetables
          : timetables // ignore: cast_nullable_to_non_nullable
              as List<Timetable>,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$ClassRoomImpl extends _ClassRoom with DiagnosticableTreeMixin {
  _$ClassRoomImpl(
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

  factory _$ClassRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassRoomImplFromJson(json);

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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClassRoom(id: $id, name: $name, createDate: $createDate, openDate: $openDate, tuition: $tuition, alert: $alert, location: $location, timetables: $timetables, isOpen: $isOpen, softIndex: $softIndex, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassRoomImplCopyWith<_$ClassRoomImpl> get copyWith =>
      __$$ClassRoomImplCopyWithImpl<_$ClassRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassRoomImplToJson(
      this,
    );
  }
}

abstract class _ClassRoom extends ClassRoom {
  factory _ClassRoom(
      {int? id,
      required String name,
      @DateTimeConverter() required DateTime createDate,
      @DateTimeConverter() required DateTime openDate,
      required int tuition,
      AlertType alert,
      String? location,
      @ListTimetableConverter() List<Timetable> timetables,
      @BoolConverter() required bool isOpen,
      int softIndex,
      String? image}) = _$ClassRoomImpl;
  _ClassRoom._() : super._();

  factory _ClassRoom.fromJson(Map<String, dynamic> json) =
      _$ClassRoomImpl.fromJson;

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
  DateTime get openDate;
  @DateTimeConverter()
  set openDate(DateTime value);
  @override
  int get tuition;
  set tuition(int value);
  @override
  AlertType get alert;
  set alert(AlertType value);
  @override
  String? get location;
  set location(String? value);
  @override
  @ListTimetableConverter()
  List<Timetable> get timetables;
  @ListTimetableConverter()
  set timetables(List<Timetable> value);
  @override
  @BoolConverter()
  bool get isOpen;
  @BoolConverter()
  set isOpen(bool value);
  @override
  int get softIndex;
  set softIndex(int value);
  @override
  String? get image;
  set image(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ClassRoomImplCopyWith<_$ClassRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
