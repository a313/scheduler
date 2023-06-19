import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/datasource/event_db.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/domain/repo_abs/event_repo_abs.dart';

import '../../core/utils/util.dart';

class EventRepoImpl extends EventRepo {
  final EventDB db;

  EventRepoImpl(this.db);
  @override
  Future<DataState<List<Event>>> getAllEvent() async {
    final data = await db.fetchAll();
    return DataSuccess(Event.getListFromDB(data));
  }

  @override
  Future<DataState<List<Event>>> getEventsFrom(
      DateTime from, DateTime to) async {
    final data = await db.getEventsFrom(
        from.millisecondsSinceEpoch, to.millisecondsSinceEpoch);
    return DataSuccess(Event.getListFromDB(data));
  }

  @override
  Future<DataState<Event>> insertOrUpdate(Event data) async {
    final id = await db.insertOrUpdate(data.toJson());
    data.id = id;
    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      return DataSuccess(data);
    }
  }

  @override
  Future<DataState<List<Event>>> getEventByType(EventType type) async {
    final data = await db.getEventByType(type);
    return DataSuccess(Event.getListFromDB(data));
  }

  @override
  Future<DataState> deleteAllEvent() async {
    return DataSuccess(await db.truncate());
  }
}
