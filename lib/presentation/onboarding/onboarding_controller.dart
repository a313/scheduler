import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/onboarding/components/ob_page.dart';
import 'package:scheduler/routes/routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  RxInt currentPage = 0.obs;

  List<Widget> get list => const [
        OnboardPage(
            imageUrl: 'assets/png/onboarding/1.jpg',
            title: 'title',
            subTitle: 'subTitle'),
        OnboardPage(
            imageUrl: 'assets/png/onboarding/2.jpg',
            title: 'title',
            subTitle: 'subTitle'),
        OnboardPage(
            imageUrl: 'assets/png/onboarding/3.jpg',
            title: 'title',
            subTitle: 'subTitle'),
        OnboardPage(
            imageUrl: 'assets/png/onboarding/4.jpg',
            title: 'title',
            subTitle: 'subTitle'),
        OnboardPage(
            imageUrl: 'assets/png/onboarding/5.jpg',
            title: 'title',
            subTitle: 'subTitle'),
      ];

  double get percent => currentPage / (list.length - 1);

  void onSkip() {
    Get.toNamed(Routes.home);
  }

  void onPageChanged(int value) {
    log(value.toString());
    currentPage.value = value;
    log('percent: $percent');
  }

  void onNext() {
    if (currentPage.value == list.length - 1) {
      Get.toNamed(Routes.home);
    } else {
      pageController.animateToPage(currentPage.value + 1,
          duration: dur300, curve: Curves.easeIn);
    }
  }
}
