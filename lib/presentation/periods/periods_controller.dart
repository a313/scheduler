import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeriodsController extends GetxController {
  Map<String, double> dataMap = {};

  final colorList = <Color>[
    Colors.greenAccent,
  ];

  @override
  void onInit() {
    for (int i = 0; i < 28; i++) {
      dataMap['${i + 1}'] = 1.0;
    }
    super.onInit();
  }
}
