import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/datasource/note_db.dart';
import 'package:scheduler/data/models/note.dart';
import 'package:scheduler/domain/repo_abs/note_repo_abs.dart';

import '../../core/utils/util.dart';

class NoteRepoImpl extends NoteRepo {
  final NoteDB db;

  NoteRepoImpl(this.db);
  @override
  Future<DataState<List<Note>>> getAllNote() async {
    final data = await db.fetchAll();
    return DataSuccess(Note.getListFromDB(data));
  }

  @override
  Future<DataState<Note>> getNoteById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<Note>> insertOrUpdate(Note data) async {
    final id = await db.insertOrUpdate(data.toJson());
    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      data.id ??= id;
      return DataSuccess(data);
    }
  }

  @override
  Future<DataState<int>> delete(int id) async {
    final data = await db.delete(id);
    if (data > 0) {
      return DataSuccess(data);
    } else {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    }
  }
}
