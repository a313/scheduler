// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Student implements DiagnosticableTreeMixin {

 int? get id; set id(int? value); String get name; set name(String value);@ListIntConverter() List<int> get classId;@ListIntConverter() set classId(List<int> value);@DateTimeConverter() DateTime get beginStudy;@DateTimeConverter() set beginStudy(DateTime value);@BoolConverter() bool get isFollow;@BoolConverter() set isFollow(bool value);@BoolConverter() bool get isSpecial;@BoolConverter() set isSpecial(bool value); int get fee; set fee(int value);@ListStringConverter() List<String> get phones;@ListStringConverter() set phones(List<String> value);@DateTimeConverter() DateTime? get lastCharge;@DateTimeConverter() set lastCharge(DateTime? value); String? get image; set image(String? value);
/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentCopyWith<Student> get copyWith => _$StudentCopyWithImpl<Student>(this as Student, _$identity);

  /// Serializes this Student to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Student'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('classId', classId))..add(DiagnosticsProperty('beginStudy', beginStudy))..add(DiagnosticsProperty('isFollow', isFollow))..add(DiagnosticsProperty('isSpecial', isSpecial))..add(DiagnosticsProperty('fee', fee))..add(DiagnosticsProperty('phones', phones))..add(DiagnosticsProperty('lastCharge', lastCharge))..add(DiagnosticsProperty('image', image));
}



@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Student(id: $id, name: $name, classId: $classId, beginStudy: $beginStudy, isFollow: $isFollow, isSpecial: $isSpecial, fee: $fee, phones: $phones, lastCharge: $lastCharge, image: $image)';
}


}

/// @nodoc
abstract mixin class $StudentCopyWith<$Res>  {
  factory $StudentCopyWith(Student value, $Res Function(Student) _then) = _$StudentCopyWithImpl;
@useResult
$Res call({
 int? id, String name,@ListIntConverter() List<int> classId,@DateTimeConverter() DateTime beginStudy,@BoolConverter() bool isFollow,@BoolConverter() bool isSpecial, int fee,@ListStringConverter() List<String> phones,@DateTimeConverter() DateTime? lastCharge, String? image
});




}
/// @nodoc
class _$StudentCopyWithImpl<$Res>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._self, this._then);

  final Student _self;
  final $Res Function(Student) _then;

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? classId = null,Object? beginStudy = null,Object? isFollow = null,Object? isSpecial = null,Object? fee = null,Object? phones = null,Object? lastCharge = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as List<int>,beginStudy: null == beginStudy ? _self.beginStudy : beginStudy // ignore: cast_nullable_to_non_nullable
as DateTime,isFollow: null == isFollow ? _self.isFollow : isFollow // ignore: cast_nullable_to_non_nullable
as bool,isSpecial: null == isSpecial ? _self.isSpecial : isSpecial // ignore: cast_nullable_to_non_nullable
as bool,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int,phones: null == phones ? _self.phones : phones // ignore: cast_nullable_to_non_nullable
as List<String>,lastCharge: freezed == lastCharge ? _self.lastCharge : lastCharge // ignore: cast_nullable_to_non_nullable
as DateTime?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Student extends Student with DiagnosticableTreeMixin {
   _Student({this.id, required this.name, @ListIntConverter() required this.classId, @DateTimeConverter() required this.beginStudy, @BoolConverter() required this.isFollow, @BoolConverter() required this.isSpecial, required this.fee, @ListStringConverter() required this.phones, @DateTimeConverter() this.lastCharge, this.image}): super._();
  factory _Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

@override  int? id;
@override  String name;
@override@ListIntConverter()  List<int> classId;
@override@DateTimeConverter()  DateTime beginStudy;
@override@BoolConverter()  bool isFollow;
@override@BoolConverter()  bool isSpecial;
@override  int fee;
@override@ListStringConverter()  List<String> phones;
@override@DateTimeConverter()  DateTime? lastCharge;
@override  String? image;

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentCopyWith<_Student> get copyWith => __$StudentCopyWithImpl<_Student>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Student'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('classId', classId))..add(DiagnosticsProperty('beginStudy', beginStudy))..add(DiagnosticsProperty('isFollow', isFollow))..add(DiagnosticsProperty('isSpecial', isSpecial))..add(DiagnosticsProperty('fee', fee))..add(DiagnosticsProperty('phones', phones))..add(DiagnosticsProperty('lastCharge', lastCharge))..add(DiagnosticsProperty('image', image));
}



@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Student(id: $id, name: $name, classId: $classId, beginStudy: $beginStudy, isFollow: $isFollow, isSpecial: $isSpecial, fee: $fee, phones: $phones, lastCharge: $lastCharge, image: $image)';
}


}

/// @nodoc
abstract mixin class _$StudentCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$StudentCopyWith(_Student value, $Res Function(_Student) _then) = __$StudentCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name,@ListIntConverter() List<int> classId,@DateTimeConverter() DateTime beginStudy,@BoolConverter() bool isFollow,@BoolConverter() bool isSpecial, int fee,@ListStringConverter() List<String> phones,@DateTimeConverter() DateTime? lastCharge, String? image
});




}
/// @nodoc
class __$StudentCopyWithImpl<$Res>
    implements _$StudentCopyWith<$Res> {
  __$StudentCopyWithImpl(this._self, this._then);

  final _Student _self;
  final $Res Function(_Student) _then;

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? classId = null,Object? beginStudy = null,Object? isFollow = null,Object? isSpecial = null,Object? fee = null,Object? phones = null,Object? lastCharge = freezed,Object? image = freezed,}) {
  return _then(_Student(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as List<int>,beginStudy: null == beginStudy ? _self.beginStudy : beginStudy // ignore: cast_nullable_to_non_nullable
as DateTime,isFollow: null == isFollow ? _self.isFollow : isFollow // ignore: cast_nullable_to_non_nullable
as bool,isSpecial: null == isSpecial ? _self.isSpecial : isSpecial // ignore: cast_nullable_to_non_nullable
as bool,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int,phones: null == phones ? _self.phones : phones // ignore: cast_nullable_to_non_nullable
as List<String>,lastCharge: freezed == lastCharge ? _self.lastCharge : lastCharge // ignore: cast_nullable_to_non_nullable
as DateTime?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
