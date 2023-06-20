import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';

import '../../core/usecase/data_state.dart';

abstract class EventRepo {
  Future<DataState<List<Event>>> getAllEvent();
  Future<DataState<List<Event>>> getEventByType(EventType type);
  Future<DataState<List<Event>>> getEventsFrom(DateTime from, DateTime to);
  Future<DataState<Event>> insertOrUpdate(Event data);
  Future<DataState> deleteAllEvent();
}