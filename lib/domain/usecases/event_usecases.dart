import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/domain/repo_abs/event_repo_abs.dart';

class EventUseCases {
  final EventRepo _;

  EventUseCases(this._);

  Future<DataState<int>> insertAll(List<Event> data) async {
    return await _.insertAll(data);
  }

  Future<DataState<Event>> insertOrUpdate(Event data) async {
    return await _.insertOrUpdate(data);
  }

  Future<DataState<List<Event>>> getEventByType(EventType type) async {
    return await _.getEventByType(type);
  }

  Future<DataState> deleteAllEvent() async {
    return await _.deleteAllEvent();
  }

  Future<DataState<int>> delete(int id) async {
    return await _.delete(id);
  }

  Future<DataState<List<Event>>> getEventsFrom(DateTime from, DateTime to,
      {OrderType type = OrderType.ASC}) async {
    return await _.getEventsFrom(from, to, type);
  }

  Future<DataState<List<Event>>> getClassEventsFrom(DateTime from, DateTime to,
      {OrderType type = OrderType.ASC}) async {
    return await _.getClassEventsFrom(from, to, type);
  }

  Future<DataState> removeEvents({
    int? parentId,
    EventType? type,
    required DateTime from,
    required DateTime to,
  }) async {
    return await _.removeEvents(
      parentId: parentId,
      type: type,
      from: from,
      to: to,
    );
  }
}
