// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_for_student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportForStudent {

 Student get student; set student(Student value); Map<ClassRoom, List<Event>> get data; set data(Map<ClassRoom, List<Event>> value);
/// Create a copy of ReportForStudent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportForStudentCopyWith<ReportForStudent> get copyWith => _$ReportForStudentCopyWithImpl<ReportForStudent>(this as ReportForStudent, _$identity);





@override
String toString() {
  return 'ReportForStudent(student: $student, data: $data)';
}


}

/// @nodoc
abstract mixin class $ReportForStudentCopyWith<$Res>  {
  factory $ReportForStudentCopyWith(ReportForStudent value, $Res Function(ReportForStudent) _then) = _$ReportForStudentCopyWithImpl;
@useResult
$Res call({
 Student student, Map<ClassRoom, List<Event>> data
});


$StudentCopyWith<$Res> get student;

}
/// @nodoc
class _$ReportForStudentCopyWithImpl<$Res>
    implements $ReportForStudentCopyWith<$Res> {
  _$ReportForStudentCopyWithImpl(this._self, this._then);

  final ReportForStudent _self;
  final $Res Function(ReportForStudent) _then;

/// Create a copy of ReportForStudent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? student = null,Object? data = null,}) {
  return _then(_self.copyWith(
student: null == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as Student,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<ClassRoom, List<Event>>,
  ));
}
/// Create a copy of ReportForStudent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentCopyWith<$Res> get student {
  
  return $StudentCopyWith<$Res>(_self.student, (value) {
    return _then(_self.copyWith(student: value));
  });
}
}


/// @nodoc


class _ReportForStudent extends ReportForStudent {
   _ReportForStudent({required this.student, required this.data}): super._();
  

@override  Student student;
@override  Map<ClassRoom, List<Event>> data;

/// Create a copy of ReportForStudent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportForStudentCopyWith<_ReportForStudent> get copyWith => __$ReportForStudentCopyWithImpl<_ReportForStudent>(this, _$identity);





@override
String toString() {
  return 'ReportForStudent(student: $student, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ReportForStudentCopyWith<$Res> implements $ReportForStudentCopyWith<$Res> {
  factory _$ReportForStudentCopyWith(_ReportForStudent value, $Res Function(_ReportForStudent) _then) = __$ReportForStudentCopyWithImpl;
@override @useResult
$Res call({
 Student student, Map<ClassRoom, List<Event>> data
});


@override $StudentCopyWith<$Res> get student;

}
/// @nodoc
class __$ReportForStudentCopyWithImpl<$Res>
    implements _$ReportForStudentCopyWith<$Res> {
  __$ReportForStudentCopyWithImpl(this._self, this._then);

  final _ReportForStudent _self;
  final $Res Function(_ReportForStudent) _then;

/// Create a copy of ReportForStudent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? student = null,Object? data = null,}) {
  return _then(_ReportForStudent(
student: null == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as Student,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<ClassRoom, List<Event>>,
  ));
}

/// Create a copy of ReportForStudent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentCopyWith<$Res> get student {
  
  return $StudentCopyWith<$Res>(_self.student, (value) {
    return _then(_self.copyWith(student: value));
  });
}
}

// dart format on
