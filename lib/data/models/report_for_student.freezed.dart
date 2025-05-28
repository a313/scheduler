// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_for_student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportForStudent {
  Student get student => throw _privateConstructorUsedError;
  set student(Student value) => throw _privateConstructorUsedError;
  Map<ClassRoom, List<Event>> get data => throw _privateConstructorUsedError;
  set data(Map<ClassRoom, List<Event>> value) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ReportForStudent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportForStudentCopyWith<ReportForStudent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportForStudentCopyWith<$Res> {
  factory $ReportForStudentCopyWith(
          ReportForStudent value, $Res Function(ReportForStudent) then) =
      _$ReportForStudentCopyWithImpl<$Res, ReportForStudent>;
  @useResult
  $Res call({Student student, Map<ClassRoom, List<Event>> data});

  $StudentCopyWith<$Res> get student;
}

/// @nodoc
class _$ReportForStudentCopyWithImpl<$Res, $Val extends ReportForStudent>
    implements $ReportForStudentCopyWith<$Res> {
  _$ReportForStudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportForStudent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? student = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<ClassRoom, List<Event>>,
    ) as $Val);
  }

  /// Create a copy of ReportForStudent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudentCopyWith<$Res> get student {
    return $StudentCopyWith<$Res>(_value.student, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportForStudentImplCopyWith<$Res>
    implements $ReportForStudentCopyWith<$Res> {
  factory _$$ReportForStudentImplCopyWith(_$ReportForStudentImpl value,
          $Res Function(_$ReportForStudentImpl) then) =
      __$$ReportForStudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Student student, Map<ClassRoom, List<Event>> data});

  @override
  $StudentCopyWith<$Res> get student;
}

/// @nodoc
class __$$ReportForStudentImplCopyWithImpl<$Res>
    extends _$ReportForStudentCopyWithImpl<$Res, _$ReportForStudentImpl>
    implements _$$ReportForStudentImplCopyWith<$Res> {
  __$$ReportForStudentImplCopyWithImpl(_$ReportForStudentImpl _value,
      $Res Function(_$ReportForStudentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportForStudent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? student = null,
    Object? data = null,
  }) {
    return _then(_$ReportForStudentImpl(
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<ClassRoom, List<Event>>,
    ));
  }
}

/// @nodoc

class _$ReportForStudentImpl extends _ReportForStudent {
  _$ReportForStudentImpl({required this.student, required this.data})
      : super._();

  @override
  Student student;
  @override
  Map<ClassRoom, List<Event>> data;

  @override
  String toString() {
    return 'ReportForStudent(student: $student, data: $data)';
  }

  /// Create a copy of ReportForStudent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportForStudentImplCopyWith<_$ReportForStudentImpl> get copyWith =>
      __$$ReportForStudentImplCopyWithImpl<_$ReportForStudentImpl>(
          this, _$identity);
}

abstract class _ReportForStudent extends ReportForStudent {
  factory _ReportForStudent(
      {required Student student,
      required Map<ClassRoom, List<Event>> data}) = _$ReportForStudentImpl;
  _ReportForStudent._() : super._();

  @override
  Student get student;
  set student(Student value);
  @override
  Map<ClassRoom, List<Event>> get data;
  set data(Map<ClassRoom, List<Event>> value);

  /// Create a copy of ReportForStudent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportForStudentImplCopyWith<_$ReportForStudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
