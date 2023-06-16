import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@unfreezed
class Reminder with _$Reminder {
  const Reminder._();

  factory Reminder(
      {int? id,
      required String name,
      @DateTimeConverter() required DateTime createDate,
      @Default(-1) int softIndex,
      String? image}) = _Reminder;

  factory Reminder.fromJson(Map<String, Object?> json) =>
      _$ReminderFromJson(json);

  static List<Reminder> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Reminder.fromJson(e)).toList();

  static Reminder init() =>
      Reminder(name: '', createDate: DateTime.now(), softIndex: -1);
}
