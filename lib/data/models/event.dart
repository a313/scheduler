import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/core/converters.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';

import 'student.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@unfreezed
class Event with _$Event {
  const Event._();
  factory Event({
    int? id,
    required String name,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    required AlertType alert,
    required RepeatType repeat,
    String? location,
    @Default([]) @ListIntConverter() List<int> classIds,
    @Default([]) @ListIntConverter() List<int> invitedIds,
    @Default([]) @ListIntConverter() List<int> joinedIds,
    String? note,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default([])
    List<Student> students,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default([])
    List<ClassRoom> classRooms,
  }) = _Event;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);

  static List<Event> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Event.fromJson(e)).toList();

  static init() => Event(
      name: '',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      alert: AlertType.Before15Min,
      repeat: RepeatType.None);
}
