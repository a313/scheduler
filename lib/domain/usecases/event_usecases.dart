import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/domain/repo_abs/event_repo_abs.dart';

class EventUseCases {
  final EventRepo _;

  EventUseCases(this._);

  Future<DataState<List<Event>>> getAllEvent() async {
    return await _.getAllEvent();
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

  Future<DataState<List<Event>>> getEventsFrom(
      DateTime from, DateTime to) async {
    return await _.getEventsFrom(from, to);
  }
}
