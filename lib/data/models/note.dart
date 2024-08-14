import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@unfreezed
class Note with _$Note {
  const Note._();

  factory Note({
    int? id,
    @DateTimeConverter() required DateTime createDate,
    String? data,
  }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);

  static List<Note> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Note.fromJson(e)).toList();
}
