import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/event.dart';

import '../../core/usecase/data_state.dart';

abstract class EventRepo {
  Future<DataState<List<Event>>> getEventByType(EventType type);
  Future<DataState<List<Event>>> getEventsFrom(
      DateTime from, DateTime to, OrderType type);
  Future<DataState<Event>> insertOrUpdate(Event data);
  Future<DataState<int>> insertAll(List<Event> data);
  Future<DataState> deleteAllEvent();

  Future<DataState> removeEvents({
    int? parentId,
    EventType? type,
    required DateTime from,
    required DateTime to,
  });

  Future<DataState<List<Event>>> getClassEventsFrom(
      DateTime from, DateTime to, OrderType type);

  Future<DataState<int>> delete(int id);
}
