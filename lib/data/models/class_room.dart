import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters.dart';

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
      @ListIntConverter() required List<int> schedulerId,
      @BoolConverter() required bool isOpen,
      @Default(-1) int softIndex,
      String? image}) = _ClassRoom;

  factory ClassRoom.fromJson(Map<String, Object?> json) =>
      _$ClassRoomFromJson(json);

  static List<ClassRoom> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => ClassRoom.fromJson(e)).toList();

  static init() => ClassRoom(
        name: '',
        createDate: DateTime.now(),
        isOpen: true,
        schedulerId: [],
        tuition: 0,
        softIndex: -1,
      );
}
