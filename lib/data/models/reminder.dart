import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@unfreezed
class Reminder with _$Reminder {
  const Reminder._();

  factory Reminder(
      {int? id,
      required String name,
      required DateTime createDate,
      @Default(-1) int softIndex,
      String? image}) = _Reminder;

  factory Reminder.fromJson(Map<String, Object?> json) =>
      _$ReminderFromJson(json);

  static List<Reminder> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Reminder.fromDB(e)).toList();

  factory Reminder.fromDB(Map<String, dynamic> json) => _$_Reminder(
        id: json['id'] as int?,
        name: json['name'] as String,
        createDate: DateTime.parse(json['createDate'] as String),
        softIndex: json['softIndex'] as int? ?? -1,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toDB() => <String, dynamic>{
        'id': id,
        'name': name,
        'createDate': createDate.toIso8601String(),
        'softIndex': softIndex,
        'image': image,
      };

  static Reminder init() =>
      Reminder(name: '', createDate: DateTime.now(), softIndex: -1);
}
