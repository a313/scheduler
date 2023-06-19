import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/timetable.dart';

import '../../core/converters.dart';

part 'class_room.freezed.dart';
part 'class_room.g.dart';

@unfreezed
class ClassRoom with _$ClassRoom {
  const ClassRoom._();
  factory ClassRoom(
      {int? id,
      required String name,
      @DateTimeConverter() required DateTime createDate,
      required int tuition,
      @Default(AlertType.None) AlertType alert,
      String? location,
      @Default([]) @ListTimetableConverter() List<Timetable> timetables,
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
        alert: AlertType.None,
        timetables: [],
        tuition: 0,
        softIndex: -1,
      );

  bool get isActive {
    return isOpen && createDate.dateWithoutTime().isBefore(DateTime.now());
  }

  bool get hasSchedule {
    return timetables.isNotEmpty;
  }
}
