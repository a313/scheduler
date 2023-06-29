import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/feature.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../../widgets/base/base_bottom_sheet.dart';

class MoreFeatureBottomSheet extends StatelessWidget {
  const MoreFeatureBottomSheet({
    super.key,
    required this.feature,
    required this.reOrder,
    required this.onTappedFeature,
  });

  final List<Feature> feature;
  final Function() reOrder;
  final Function(Feature feature) onTappedFeature;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: Get.back,
            child: const SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
        BaseBottomSheet(
          subTitle: TextButton(onPressed: reOrder, child: Text('Reorder'.tr)),
          title: 'Features'.tr,
          child: Padding(
            padding: padAll16,
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                alignment: WrapAlignment.start,
                children: List.generate(feature.length, (index) {
                  final obj = feature[index];
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => onTappedFeature(obj),
                    child: SizedBox(
                      width: 56,
                      child: Column(
                        children: [
                          obj.item.icon,
                          sizedBoxH02,
                          Text(
                            obj.item.label ?? "",
                            style: AppFonts.h100
                                .copyWith(color: context.neutral600),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
