import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/core/utils/util.dart';

part 'class_room.freezed.dart';
part 'class_room.g.dart';

@unfreezed
class ClassRoom with _$ClassRoom {
  const ClassRoom._();
  factory ClassRoom(
      {int? id,
      required String name,
      required DateTime createDate,
      required int tuition,
      required bool isOpen,
      @Default(-1) int softIndex,
      String? image}) = _ClassRoom;

  factory ClassRoom.fromJson(Map<String, Object?> json) =>
      _$ClassRoomFromJson(json);

  static List<ClassRoom> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => ClassRoom.fromDB(e)).toList();

  static ClassRoom fromDB(Map<String, dynamic> json) {
    return ClassRoom(
      id: json['id'] as int?,
      name: json['name'] as String,
      // schedulerIds: (json['schedulerIds'] as String).toListInt(PATTERN),
      createDate: DateTime.parse(json['createDate'] as String),
      tuition: json['tuition'] as int,
      isOpen: (json['isOpen'] as int).toBool,
      softIndex: json['softIndex'] as int? ?? -1,
      image: json['image'] as String?,
    );
  }

  Map<String, Object?> toDB() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      // 'schedulerIds': schedulerIds.join(PATTERN),
      'createDate': createDate.toIso8601String(),
      'tuition': tuition,
      'isOpen': isOpen,
      'softIndex': softIndex,
      'image': image,
    };
  }

  static init() => ClassRoom(
        name: '',
        createDate: DateTime.now(),
        isOpen: true,
        tuition: 0,
        softIndex: -1,
      );
}
