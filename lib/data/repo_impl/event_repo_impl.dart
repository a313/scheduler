import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/sqlite_db/event_db.dart';
import 'package:aio/data/models/event.dart';
import 'package:aio/domain/repo_abs/event_repo_abs.dart';

import '../../core/utils/util.dart';

class EventRepoImpl extends EventRepo {
  final EventDB db;

  EventRepoImpl(this.db);

  @override
  Future<DataState<List<Event>>> getEventsFrom(
      DateTime from, DateTime to, OrderType type) async {
    final data = await db.getEventsFrom(
        from.millisecondsSinceEpoch, to.millisecondsSinceEpoch, type);
    return DataSuccess(Event.getListFromDB(data));
  }

  @override
  Future<DataState<int>> insertAll(List<Event> data) async {
    final count = await db.insertAll(data.map((e) => e.toJson()));
    if (count == null) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      return DataSuccess(count);
    }
  }

  @override
  Future<DataState<Event>> insertOrUpdate(Event data) async {
    if (data.id != null) {
      data.type = EventType.Modified;
    }
    final id = await db.insertOrUpdate(data.toJson());
    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      data.id ??= id;
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

  @override
  Future<DataState> removeEvents(
      {int? parentId,
      EventType? type,
      required DateTime from,
      required DateTime to}) async {
    return DataSuccess(await db.removeEvents(
      parentId: parentId,
      type: type,
      from: from.millisecondsSinceEpoch,
      to: to.millisecondsSinceEpoch,
    ));
  }

  @override
  Future<DataState<List<Event>>> getClassEventsFrom(
      DateTime from, DateTime to, OrderType type) async {
    final data = await db.getClassEventsFrom(
        from.millisecondsSinceEpoch, to.millisecondsSinceEpoch, type);
    return DataSuccess(Event.getListFromDB(data));
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
