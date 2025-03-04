// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Student _$StudentFromJson(Map<String, dynamic> json) {
  return _Student.fromJson(json);
}

/// @nodoc
mixin _$Student {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  @ListIntConverter()
  List<int> get classId => throw _privateConstructorUsedError;
  @ListIntConverter()
  set classId(List<int> value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get beginStudy => throw _privateConstructorUsedError;
  @DateTimeConverter()
  set beginStudy(DateTime value) => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get isFollow => throw _privateConstructorUsedError;
  @BoolConverter()
  set isFollow(bool value) => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get isSpecial => throw _privateConstructorUsedError;
  @BoolConverter()
  set isSpecial(bool value) => throw _privateConstructorUsedError;
  int get fee => throw _privateConstructorUsedError;
  set fee(int value) => throw _privateConstructorUsedError;
  @ListStringConverter()
  List<String> get phones => throw _privateConstructorUsedError;
  @ListStringConverter()
  set phones(List<String> value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get lastCharge => throw _privateConstructorUsedError;
  @DateTimeConverter()
  set lastCharge(DateTime? value) => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  set image(String? value) => throw _privateConstructorUsedError;

  /// Serializes this Student to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentCopyWith<Student> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentCopyWith<$Res> {
  factory $StudentCopyWith(Student value, $Res Function(Student) then) =
      _$StudentCopyWithImpl<$Res, Student>;
  @useResult
  $Res call(
      {int? id,
      String name,
      @ListIntConverter() List<int> classId,
      @DateTimeConverter() DateTime beginStudy,
      @BoolConverter() bool isFollow,
      @BoolConverter() bool isSpecial,
      int fee,
      @ListStringConverter() List<String> phones,
      @DateTimeConverter() DateTime? lastCharge,
      String? image});
}

/// @nodoc
class _$StudentCopyWithImpl<$Res, $Val extends Student>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? classId = null,
    Object? beginStudy = null,
    Object? isFollow = null,
    Object? isSpecial = null,
    Object? fee = null,
    Object? phones = null,
    Object? lastCharge = freezed,
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
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      beginStudy: null == beginStudy
          ? _value.beginStudy
          : beginStudy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFollow: null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpecial: null == isSpecial
          ? _value.isSpecial
          : isSpecial // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      phones: null == phones
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastCharge: freezed == lastCharge
          ? _value.lastCharge
          : lastCharge // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentImplCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$$StudentImplCopyWith(
          _$StudentImpl value, $Res Function(_$StudentImpl) then) =
      __$$StudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      @ListIntConverter() List<int> classId,
      @DateTimeConverter() DateTime beginStudy,
      @BoolConverter() bool isFollow,
      @BoolConverter() bool isSpecial,
      int fee,
      @ListStringConverter() List<String> phones,
      @DateTimeConverter() DateTime? lastCharge,
      String? image});
}

/// @nodoc
class __$$StudentImplCopyWithImpl<$Res>
    extends _$StudentCopyWithImpl<$Res, _$StudentImpl>
    implements _$$StudentImplCopyWith<$Res> {
  __$$StudentImplCopyWithImpl(
      _$StudentImpl _value, $Res Function(_$StudentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? classId = null,
    Object? beginStudy = null,
    Object? isFollow = null,
    Object? isSpecial = null,
    Object? fee = null,
    Object? phones = null,
    Object? lastCharge = freezed,
    Object? image = freezed,
  }) {
    return _then(_$StudentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      beginStudy: null == beginStudy
          ? _value.beginStudy
          : beginStudy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFollow: null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpecial: null == isSpecial
          ? _value.isSpecial
          : isSpecial // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      phones: null == phones
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastCharge: freezed == lastCharge
          ? _value.lastCharge
          : lastCharge // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentImpl extends _Student with DiagnosticableTreeMixin {
  _$StudentImpl(
      {this.id,
      required this.name,
      @ListIntConverter() required this.classId,
      @DateTimeConverter() required this.beginStudy,
      @BoolConverter() required this.isFollow,
      @BoolConverter() required this.isSpecial,
      required this.fee,
      @ListStringConverter() required this.phones,
      @DateTimeConverter() this.lastCharge,
      this.image})
      : super._();

  factory _$StudentImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentImplFromJson(json);

  @override
  int? id;
  @override
  String name;
  @override
  @ListIntConverter()
  List<int> classId;
  @override
  @DateTimeConverter()
  DateTime beginStudy;
  @override
  @BoolConverter()
  bool isFollow;
  @override
  @BoolConverter()
  bool isSpecial;
  @override
  int fee;
  @override
  @ListStringConverter()
  List<String> phones;
  @override
  @DateTimeConverter()
  DateTime? lastCharge;
  @override
  String? image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Student(id: $id, name: $name, classId: $classId, beginStudy: $beginStudy, isFollow: $isFollow, isSpecial: $isSpecial, fee: $fee, phones: $phones, lastCharge: $lastCharge, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Student'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('classId', classId))
      ..add(DiagnosticsProperty('beginStudy', beginStudy))
      ..add(DiagnosticsProperty('isFollow', isFollow))
      ..add(DiagnosticsProperty('isSpecial', isSpecial))
      ..add(DiagnosticsProperty('fee', fee))
      ..add(DiagnosticsProperty('phones', phones))
      ..add(DiagnosticsProperty('lastCharge', lastCharge))
      ..add(DiagnosticsProperty('image', image));
  }

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      __$$StudentImplCopyWithImpl<_$StudentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentImplToJson(
      this,
    );
  }
}

abstract class _Student extends Student {
  factory _Student(
      {int? id,
      required String name,
      @ListIntConverter() required List<int> classId,
      @DateTimeConverter() required DateTime beginStudy,
      @BoolConverter() required bool isFollow,
      @BoolConverter() required bool isSpecial,
      required int fee,
      @ListStringConverter() required List<String> phones,
      @DateTimeConverter() DateTime? lastCharge,
      String? image}) = _$StudentImpl;
  _Student._() : super._();

  factory _Student.fromJson(Map<String, dynamic> json) = _$StudentImpl.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  String get name;
  set name(String value);
  @override
  @ListIntConverter()
  List<int> get classId;
  @ListIntConverter()
  set classId(List<int> value);
  @override
  @DateTimeConverter()
  DateTime get beginStudy;
  @DateTimeConverter()
  set beginStudy(DateTime value);
  @override
  @BoolConverter()
  bool get isFollow;
  @BoolConverter()
  set isFollow(bool value);
  @override
  @BoolConverter()
  bool get isSpecial;
  @BoolConverter()
  set isSpecial(bool value);
  @override
  int get fee;
  set fee(int value);
  @override
  @ListStringConverter()
  List<String> get phones;
  @ListStringConverter()
  set phones(List<String> value);
  @override
  @DateTimeConverter()
  DateTime? get lastCharge;
  @DateTimeConverter()
  set lastCharge(DateTime? value);
  @override
  String? get image;
  set image(String? value);

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
