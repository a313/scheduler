import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';

import '../../core/usecase/data_state.dart';

abstract class EventRepo {
  Future<DataState<List<Event>>> getEventByType(EventType type);
  Future<DataState<List<Event>>> getEventsFrom(
      DateTime from, DateTime to, OrderType type);
  Future<DataState<Event>> insertOrUpdate(Event data);
  Future<DataState<int>> insertAll(List<Event> data);
  Future<DataState> deleteAllEvent();

  Future<DataState> removeEvents({
    required int parentId,
    required EventType type,
    required DateTime from,
    required DateTime to,
  });
}
