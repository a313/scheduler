// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_for_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportForClass {
  ClassRoom get classRoom => throw _privateConstructorUsedError;
  List<Event> get events => throw _privateConstructorUsedError;

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportForClassCopyWith<ReportForClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportForClassCopyWith<$Res> {
  factory $ReportForClassCopyWith(
          ReportForClass value, $Res Function(ReportForClass) then) =
      _$ReportForClassCopyWithImpl<$Res, ReportForClass>;
  @useResult
  $Res call({ClassRoom classRoom, List<Event> events});

  $ClassRoomCopyWith<$Res> get classRoom;
}

/// @nodoc
class _$ReportForClassCopyWithImpl<$Res, $Val extends ReportForClass>
    implements $ReportForClassCopyWith<$Res> {
  _$ReportForClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classRoom = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      classRoom: null == classRoom
          ? _value.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as ClassRoom,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ) as $Val);
  }

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassRoomCopyWith<$Res> get classRoom {
    return $ClassRoomCopyWith<$Res>(_value.classRoom, (value) {
      return _then(_value.copyWith(classRoom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportForClassImplCopyWith<$Res>
    implements $ReportForClassCopyWith<$Res> {
  factory _$$ReportForClassImplCopyWith(_$ReportForClassImpl value,
          $Res Function(_$ReportForClassImpl) then) =
      __$$ReportForClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ClassRoom classRoom, List<Event> events});

  @override
  $ClassRoomCopyWith<$Res> get classRoom;
}

/// @nodoc
class __$$ReportForClassImplCopyWithImpl<$Res>
    extends _$ReportForClassCopyWithImpl<$Res, _$ReportForClassImpl>
    implements _$$ReportForClassImplCopyWith<$Res> {
  __$$ReportForClassImplCopyWithImpl(
      _$ReportForClassImpl _value, $Res Function(_$ReportForClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classRoom = null,
    Object? events = null,
  }) {
    return _then(_$ReportForClassImpl(
      classRoom: null == classRoom
          ? _value.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as ClassRoom,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc

class _$ReportForClassImpl extends _ReportForClass {
  _$ReportForClassImpl(
      {required this.classRoom, required final List<Event> events})
      : _events = events,
        super._();

  @override
  final ClassRoom classRoom;
  final List<Event> _events;
  @override
  List<Event> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'ReportForClass(classRoom: $classRoom, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportForClassImpl &&
            (identical(other.classRoom, classRoom) ||
                other.classRoom == classRoom) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, classRoom, const DeepCollectionEquality().hash(_events));

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportForClassImplCopyWith<_$ReportForClassImpl> get copyWith =>
      __$$ReportForClassImplCopyWithImpl<_$ReportForClassImpl>(
          this, _$identity);
}

abstract class _ReportForClass extends ReportForClass {
  factory _ReportForClass(
      {required final ClassRoom classRoom,
      required final List<Event> events}) = _$ReportForClassImpl;
  _ReportForClass._() : super._();

  @override
  ClassRoom get classRoom;
  @override
  List<Event> get events;

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportForClassImplCopyWith<_$ReportForClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
