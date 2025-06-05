import 'package:aio/data/models/event.dart';

import '../../core/utils/util.dart';
import '../repo_abs/notification_repo_abs.dart';

class NotificationUseCases {
  final NotificationRepo _;
  NotificationUseCases(this._);

  void cancelAll() {
    _.cancelAll();
  }

  void removeNotis({
    required int parentId,
    required EventType type,
    required DateTime from,
    required DateTime to,
  }) async {}

  void createNotiFor(List<Event> events) {
    cancelAll();
    for (var e in events) {
      if (e.alert != AlertType.None) {
        final time = e.startTime;
        final dur = e.alert.toDuration;
        final alertTime = time.subtract(dur);
        if (alertTime.isBefore(DateTime.now())) continue;
        final difference = e.endTime.difference(e.startTime).formatInDuration();
        final subfix = difference.isEmpty ? '' : '\n(in $difference)';
        final desc = '@${time.toStringFormat(DateFormater.HHmm)} $subfix';
        _.createNoti(e.id ?? 0, e.name, desc, alertTime);
      }
    }
  }
}
