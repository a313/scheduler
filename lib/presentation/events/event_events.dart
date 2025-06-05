import 'package:aio/core/manager/event_tracking.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/event.dart';

class EventEvent extends EventTracking {
  EventEvent({String? eventName}) : super(name: eventName ?? "Event");

  factory EventEvent.reloadData(DateTime firstDay, DateTime lastDay) {
    return EventEvent(eventName: 'reloadData')
      ..other = {
        'firstDay': firstDay.toTimeDateString(),
        'lastDay': lastDay.toTimeDateString()
      };
  }

  factory EventEvent.generateEvent(
      DateTime firstDay, DateTime lastDay, int lenght) {
    return EventEvent(eventName: 'generateEvent')
      ..other = {
        'firstDay': firstDay.toTimeDateString(),
        'lastDay': lastDay.toTimeDateString(),
        'lenght': lenght.toString()
      };
  }

  factory EventEvent.editJoined(int? id, List<int> origin, List<int> modified) {
    return EventEvent(eventName: 'editJoined')
      ..other = {
        'id': id.toString(),
        'origin': origin.join(','),
        'modified': modified.join(',')
      };
  }

  factory EventEvent.onDaySelected(DateTime firstDay, DateTime lastDay) {
    return EventEvent(eventName: 'onDaySelected')
      ..other = {
        'firstDay': firstDay.toTimeDateString(),
        'lastDay': lastDay.toTimeDateString()
      };
  }

  factory EventEvent.onRefresh(DateTime firstDay, DateTime lastDay) {
    return EventEvent(eventName: 'onRefresh')
      ..other = {
        'firstDay': firstDay.toTimeDateString(),
        'lastDay': lastDay.toTimeDateString()
      };
  }

  factory EventEvent.onLoading(DateTime firstDay, DateTime lastDay) {
    return EventEvent(eventName: 'onLoading')
      ..other = {
        'firstDay': firstDay.toTimeDateString(),
        'lastDay': lastDay.toTimeDateString()
      };
  }

  factory EventEvent.onInitEditEvent(Event data) {
    return EventEvent(eventName: 'onInitEditEvent')
      ..other = {
        'data': data.toString(),
      };
  }

  factory EventEvent.onInsertOrUpdate(Event data) {
    return EventEvent(eventName: 'onInsertOrUpdate')
      ..other = {
        'data': data.toString(),
      };
  }
}
