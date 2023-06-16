import 'package:scheduler/data/models/event.dart';

import '../../core/usecase/data_state.dart';

abstract class EventRepo {
  Future<DataState<List<Event>>> getAllEvent();
  Future<DataState<Event>> insertOrUpdate(Event data);
}
