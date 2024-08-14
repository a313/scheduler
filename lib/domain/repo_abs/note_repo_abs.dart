import 'package:scheduler/data/models/note.dart';

import '../../core/usecase/data_state.dart';

abstract class NoteRepo {
  Future<DataState<List<Note>>> getAllNote();
  Future<DataState<Note>> getNoteById(int id);
  Future<DataState<Note>> insertOrUpdate(Note data);
  Future<DataState<int>> delete(int id);
}
