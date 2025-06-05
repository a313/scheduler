// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_for_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportForClass {
  ClassRoom get classRoom;
  List<Event> get events;

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportForClassCopyWith<ReportForClass> get copyWith =>
      _$ReportForClassCopyWithImpl<ReportForClass>(
          this as ReportForClass, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportForClass &&
            (identical(other.classRoom, classRoom) ||
                other.classRoom == classRoom) &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, classRoom, const DeepCollectionEquality().hash(events));

  @override
  String toString() {
    return 'ReportForClass(classRoom: $classRoom, events: $events)';
  }
}

/// @nodoc
abstract mixin class $ReportForClassCopyWith<$Res> {
  factory $ReportForClassCopyWith(
          ReportForClass value, $Res Function(ReportForClass) _then) =
      _$ReportForClassCopyWithImpl;
  @useResult
  $Res call({ClassRoom classRoom, List<Event> events});

  $ClassRoomCopyWith<$Res> get classRoom;
}

/// @nodoc
class _$ReportForClassCopyWithImpl<$Res>
    implements $ReportForClassCopyWith<$Res> {
  _$ReportForClassCopyWithImpl(this._self, this._then);

  final ReportForClass _self;
  final $Res Function(ReportForClass) _then;

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classRoom = null,
    Object? events = null,
  }) {
    return _then(_self.copyWith(
      classRoom: null == classRoom
          ? _self.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as ClassRoom,
      events: null == events
          ? _self.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassRoomCopyWith<$Res> get classRoom {
    return $ClassRoomCopyWith<$Res>(_self.classRoom, (value) {
      return _then(_self.copyWith(classRoom: value));
    });
  }
}

/// @nodoc

class _ReportForClass extends ReportForClass {
  _ReportForClass({required this.classRoom, required final List<Event> events})
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

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportForClassCopyWith<_ReportForClass> get copyWith =>
      __$ReportForClassCopyWithImpl<_ReportForClass>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportForClass &&
            (identical(other.classRoom, classRoom) ||
                other.classRoom == classRoom) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, classRoom, const DeepCollectionEquality().hash(_events));

  @override
  String toString() {
    return 'ReportForClass(classRoom: $classRoom, events: $events)';
  }
}

/// @nodoc
abstract mixin class _$ReportForClassCopyWith<$Res>
    implements $ReportForClassCopyWith<$Res> {
  factory _$ReportForClassCopyWith(
          _ReportForClass value, $Res Function(_ReportForClass) _then) =
      __$ReportForClassCopyWithImpl;
  @override
  @useResult
  $Res call({ClassRoom classRoom, List<Event> events});

  @override
  $ClassRoomCopyWith<$Res> get classRoom;
}

/// @nodoc
class __$ReportForClassCopyWithImpl<$Res>
    implements _$ReportForClassCopyWith<$Res> {
  __$ReportForClassCopyWithImpl(this._self, this._then);

  final _ReportForClass _self;
  final $Res Function(_ReportForClass) _then;

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? classRoom = null,
    Object? events = null,
  }) {
    return _then(_ReportForClass(
      classRoom: null == classRoom
          ? _self.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as ClassRoom,
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }

  /// Create a copy of ReportForClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassRoomCopyWith<$Res> get classRoom {
    return $ClassRoomCopyWith<$Res>(_self.classRoom, (value) {
      return _then(_self.copyWith(classRoom: value));
    });
  }
}

// dart format on
