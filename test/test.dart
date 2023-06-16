import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:scheduler/core/utils/util.dart';

void main() async {
  test('Unit Test', () {
    final today = DateTime.now();
    log(today.toStringFormat(DateFormat.ABBR_STANDALONE_MONTH));
  });
}
