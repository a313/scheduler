import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'components/feature_component.dart';
import 'components/user_component.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScafold(
        body: Column(
      children: [
        UserComponent(),
        FeatureComponent(),
        SizedBox(),
      ],
    ));
  }
}
