import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('Unit Test', () {
    const itemPerGroup = 2;
    List<dynamic> data = [0, 1, 2, 3, 4, 5];
    List<List<dynamic>> group = [];
    int groupCount = data.length ~/ itemPerGroup + 1;
    for (int i = 0; i < groupCount; i++) {
      group.add(data
          .getRange(i * itemPerGroup, min((i + 1) * itemPerGroup, data.length))
          .toList());
    }
    expect(groupCount, 3);
  });
}
