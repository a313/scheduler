import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../widgets/animations/circle_progress_bar.dart';
import 'onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned.fill(
              child: SizedBox(
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  children: controller.list,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SafeArea(
                minimum: padAll16,
                child: TextButton(
                  onPressed: controller.onSkip,
                  child: const Text('Skip', style: AppFonts.bMedium),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SafeArea(
                minimum: padAll16,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Obx(() => CircleProgressBar(
                            backgroundColor: Colors.white,
                            foregroundColor: context.primaryDark,
                            value: controller.percent,
                          )),
                    ),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.primaryDark.withOpacity(0.5),
                      ),
                      child: IconButton(
                        onPressed: controller.onNext,
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        iconSize: 15,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
