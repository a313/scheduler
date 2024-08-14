import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aio/core/converters.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/class_room.dart';

import 'student.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@unfreezed
class Event with _$Event {
  const Event._();
  factory Event({
    int? id,
    int? parentId,
    required String name,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    required EventType type,
    required AlertType alert,
    required RepeatType repeat,
    String? location,
    int? classId,
    @Default([]) @ListIntConverter() List<int> invitedIds,
    @Default([]) @ListIntConverter() List<int> joinedIds,
    @Default(true) @BoolConverter() bool isActive,
    String? note,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default([])
    List<Student> students,
    @JsonKey(includeToJson: false, includeFromJson: false) ClassRoom? classRoom,
  }) = _Event;

  @override
  bool operator ==(Object other) =>
      other is Event &&
      other.id == id &&
      other.parentId == parentId &&
      other.name == name &&
      other.startTime == startTime &&
      other.endTime == endTime &&
      other.alert == alert &&
      other.repeat == repeat &&
      other.location == location &&
      other.classId == classId &&
      listEquals(other.invitedIds, invitedIds) &&
      listEquals(joinedIds, joinedIds) &&
      other.isActive == isActive &&
      other.note == note;

  @override
  int get hashCode =>
      id.hashCode ^
      parentId.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      alert.hashCode ^
      repeat.hashCode ^
      location.hashCode ^
      classId.hashCode ^
      invitedIds.hashCode ^
      joinedIds.hashCode ^
      isActive.hashCode ^
      note.hashCode;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);

  static List<Event> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Event.fromJson(e)).toList();

  static init() {
    final now = DateTime.now().dateWithoutMinute();
    return Event(
        name: '',
        startTime: now,
        type: EventType.Origin,
        endTime: now.add(const Duration(hours: 1)),
        alert: AlertType.Before15Min,
        repeat: RepeatType.None);
  }

  Duration get duration => endTime.difference(startTime);

  Color get colorByType {
    switch (type) {
      case EventType.Origin:
        return Colors.indigo;
      case EventType.Modified:
        return Colors.black12;
      case EventType.GeneradeClass:
        return Colors.lightBlue;
      case EventType.GeneradeReminder:
        return Colors.lightGreen;
    }
  }
}
