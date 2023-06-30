import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/setting/components/setting_cell.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import '../../widgets/custom_card.dart';
import 'setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Setting'.tr,
        backgroundColor: context.neutral200,
        body: GetBuilder<SettingController>(
          builder: (_) {
            return SingleChildScrollView(
              padding: padAll16,
              child: Column(
                children: [
                  CustomCard(
                    child: Column(
                      children: [
                        SettingCell(
                          prefix: const Icon(Icons.language),
                          label: 'Language'.tr,
                          content: controller.language.tr,
                          onTap: controller.onTapLanguage,
                        ),
                        const CustomDivider(indent: 48),
                        SettingCell(
                          prefix: const Icon(Icons.dark_mode),
                          label: 'Appearance'.tr,
                          content: controller.theme.tr,
                          onTap: controller.onTapAppearance,
                        )
                      ],
                    ),
                  ),
                  sizedBoxH16,
                  CustomCard(
                    child: Column(
                      children: [
                        SettingCell(
                          prefix:
                              SvgPicture.asset('assets/svg/Regular/Timer.svg'),
                          label: 'Schedule'.tr,
                          onTap: controller.onTapSchedule,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
