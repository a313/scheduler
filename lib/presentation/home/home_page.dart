import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/nav_bar.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        key: controller.scaffoldKey,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: MainNavBar(
          currentIndex: controller.currentIndex,
          onTap: (index) => controller.onChangedTab(context, index),
          items: controller.barItems,
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: controller.barPages,
        ),
      );
    });
  }
}
