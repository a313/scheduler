import 'package:scheduler/data/models/note.dart';
import 'package:scheduler/domain/repo_abs/note_repo_abs.dart';

import '../../core/usecase/data_state.dart';

class NoteUseCases {
  final NoteRepo _;

  NoteUseCases(this._);

  Future<DataState<List<Note>>> getAllNote() async {
    return await _.getAllNote();
  }

  Future<DataState<Note>> insertOrUpdate(Note data) async {
    return await _.insertOrUpdate(data);
  }

  Future<DataState<int>> delete(int id) async {
    return await _.delete(id);
  }
}
