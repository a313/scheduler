import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/home/home_controller.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../../domain/entities/feature.dart';

class FeatureComponent extends GetWidget<HomeController> {
  const FeatureComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final itemSize = (min(Get.height, Get.width) - 32) / 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: padSymHor16,
          child: Text(
            'Features',
            style: AppFonts.h500,
          ),
        ),
        sizedBoxH08,
        SizedBox(
          width: double.infinity,
          child: Wrap(
            runSpacing: 8,
            children: List.generate(
                controller.features.length,
                (index) => FeatureItem(
                      data: controller.features[index],
                      itemSize: itemSize,
                    )),
          ),
        )
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
    required this.data,
    required this.itemSize,
  });
  final Feature data;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: data.onTap,
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                Expanded(child: Image.asset(data.image)),
                sizedBoxH04,
                Text(
                  data.title,
                  style: AppFonts.bSuperSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
