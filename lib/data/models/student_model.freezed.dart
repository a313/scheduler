// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) {
  return _StudentModel.fromJson(json);
}

/// @nodoc
mixin _$StudentModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<int> get classIds => throw _privateConstructorUsedError;
  DateTime get beginStudy => throw _privateConstructorUsedError;
  DateTime get lastCharge => throw _privateConstructorUsedError;
  String get phones => throw _privateConstructorUsedError;
  bool get isSpecial => throw _privateConstructorUsedError;
  int? get fee => throw _privateConstructorUsedError;
  bool get isFollow => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentModelCopyWith<StudentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentModelCopyWith<$Res> {
  factory $StudentModelCopyWith(
          StudentModel value, $Res Function(StudentModel) then) =
      _$StudentModelCopyWithImpl<$Res, StudentModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      List<int> classIds,
      DateTime beginStudy,
      DateTime lastCharge,
      String phones,
      bool isSpecial,
      int? fee,
      bool isFollow,
      String? image});
}

/// @nodoc
class _$StudentModelCopyWithImpl<$Res, $Val extends StudentModel>
    implements $StudentModelCopyWith<$Res> {
  _$StudentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? classIds = null,
    Object? beginStudy = null,
    Object? lastCharge = null,
    Object? phones = null,
    Object? isSpecial = null,
    Object? fee = freezed,
    Object? isFollow = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      classIds: null == classIds
          ? _value.classIds
          : classIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      beginStudy: null == beginStudy
          ? _value.beginStudy
          : beginStudy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastCharge: null == lastCharge
          ? _value.lastCharge
          : lastCharge // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phones: null == phones
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as String,
      isSpecial: null == isSpecial
          ? _value.isSpecial
          : isSpecial // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      isFollow: null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StudentModelCopyWith<$Res>
    implements $StudentModelCopyWith<$Res> {
  factory _$$_StudentModelCopyWith(
          _$_StudentModel value, $Res Function(_$_StudentModel) then) =
      __$$_StudentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      List<int> classIds,
      DateTime beginStudy,
      DateTime lastCharge,
      String phones,
      bool isSpecial,
      int? fee,
      bool isFollow,
      String? image});
}

/// @nodoc
class __$$_StudentModelCopyWithImpl<$Res>
    extends _$StudentModelCopyWithImpl<$Res, _$_StudentModel>
    implements _$$_StudentModelCopyWith<$Res> {
  __$$_StudentModelCopyWithImpl(
      _$_StudentModel _value, $Res Function(_$_StudentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? classIds = null,
    Object? beginStudy = null,
    Object? lastCharge = null,
    Object? phones = null,
    Object? isSpecial = null,
    Object? fee = freezed,
    Object? isFollow = null,
    Object? image = freezed,
  }) {
    return _then(_$_StudentModel(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == classIds
          ? _value._classIds
          : classIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      null == beginStudy
          ? _value.beginStudy
          : beginStudy // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == lastCharge
          ? _value.lastCharge
          : lastCharge // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == phones
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as String,
      null == isSpecial
          ? _value.isSpecial
          : isSpecial // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StudentModel implements _StudentModel {
  _$_StudentModel(
      this.id,
      this.name,
      final List<int> classIds,
      this.beginStudy,
      this.lastCharge,
      this.phones,
      this.isSpecial,
      this.fee,
      this.isFollow,
      this.image)
      : _classIds = classIds;

  factory _$_StudentModel.fromJson(Map<String, dynamic> json) =>
      _$$_StudentModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<int> _classIds;
  @override
  List<int> get classIds {
    if (_classIds is EqualUnmodifiableListView) return _classIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_classIds);
  }

  @override
  final DateTime beginStudy;
  @override
  final DateTime lastCharge;
  @override
  final String phones;
  @override
  final bool isSpecial;
  @override
  final int? fee;
  @override
  final bool isFollow;
  @override
  final String? image;

  @override
  String toString() {
    return 'StudentModel(id: $id, name: $name, classIds: $classIds, beginStudy: $beginStudy, lastCharge: $lastCharge, phones: $phones, isSpecial: $isSpecial, fee: $fee, isFollow: $isFollow, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._classIds, _classIds) &&
            (identical(other.beginStudy, beginStudy) ||
                other.beginStudy == beginStudy) &&
            (identical(other.lastCharge, lastCharge) ||
                other.lastCharge == lastCharge) &&
            (identical(other.phones, phones) || other.phones == phones) &&
            (identical(other.isSpecial, isSpecial) ||
                other.isSpecial == isSpecial) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.isFollow, isFollow) ||
                other.isFollow == isFollow) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_classIds),
      beginStudy,
      lastCharge,
      phones,
      isSpecial,
      fee,
      isFollow,
      image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StudentModelCopyWith<_$_StudentModel> get copyWith =>
      __$$_StudentModelCopyWithImpl<_$_StudentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StudentModelToJson(
      this,
    );
  }
}

abstract class _StudentModel implements StudentModel {
  factory _StudentModel(
      final int id,
      final String name,
      final List<int> classIds,
      final DateTime beginStudy,
      final DateTime lastCharge,
      final String phones,
      final bool isSpecial,
      final int? fee,
      final bool isFollow,
      final String? image) = _$_StudentModel;

  factory _StudentModel.fromJson(Map<String, dynamic> json) =
      _$_StudentModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<int> get classIds;
  @override
  DateTime get beginStudy;
  @override
  DateTime get lastCharge;
  @override
  String get phones;
  @override
  bool get isSpecial;
  @override
  int? get fee;
  @override
  bool get isFollow;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_StudentModelCopyWith<_$_StudentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
