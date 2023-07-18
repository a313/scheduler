import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'weather_controller.dart';

class WeatherPage extends GetView<WeatherController> {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(title: 'Weather'.tr, body: const Column());
  }
}
