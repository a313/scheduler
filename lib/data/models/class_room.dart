import 'package:flutter/foundation.dart';
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
      @DateTimeConverter() required DateTime openDate,
      required int tuition,
      @Default(AlertType.None) AlertType alert,
      String? location,
      @Default([]) @ListTimetableConverter() List<Timetable> timetables,
      @BoolConverter() required bool isOpen,
      @Default(-1) int softIndex,
      String? image}) = _ClassRoom;

  @override
  bool operator ==(Object other) =>
      other is ClassRoom &&
      other.id == id &&
      other.name == name &&
      other.createDate == createDate &&
      other.openDate == openDate &&
      other.alert == alert &&
      other.tuition == tuition &&
      other.location == location &&
      listEquals(other.timetables, timetables) &&
      other.softIndex == softIndex &&
      other.image == image;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      createDate.hashCode ^
      openDate.hashCode ^
      alert.hashCode ^
      tuition.hashCode ^
      location.hashCode ^
      timetables.hashCode ^
      softIndex.hashCode ^
      image.hashCode;

  factory ClassRoom.fromJson(Map<String, Object?> json) =>
      _$ClassRoomFromJson(json);

  static List<ClassRoom> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => ClassRoom.fromJson(e)).toList();

  static init({String name = ''}) => ClassRoom(
        name: name,
        createDate: DateTime.now().dateWithoutTime(),
        openDate: DateTime.now().dateWithoutTime(),
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

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is ClassRoom &&
  //       other.name == name &&
  //       other.createDate == createDate &&
  //       other.openDate == openDate &&
  //       other.alert == alert &&
  //       other.tuition == tuition &&
  //       other.location == location &&
  //       listEquals(other.timetables, timetables) &&
  //       other.isOpen == isOpen;
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //       createDate.hashCode ^
  //       openDate.hashCode ^
  //       tuition.hashCode ^
  //       location.hashCode ^
  //       timetables.hashCode ^
  //       isOpen.hashCode;
  // }
}
