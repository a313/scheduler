import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/setting/components/setting_cell.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import '../../widgets/custom_card.dart';
import 'components/app_icon.dart';
import 'setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (_) {
        return BaseScaffoldAppBar(
            title: 'Setting'.tr,
            key: UniqueKey(),
            backgroundColor: context.neutral200,
            fab: FloatingActionButton(onPressed: controller.update),
            body: SingleChildScrollView(
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
                  sizedBoxH16,
                  CustomCard(
                    child: SizedBox(
                      height: 120,
                      child: ListView.separated(
                        padding: padAll16,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.appIcons.length,
                        itemBuilder: (context, index) => AppIcon(
                          data: controller.appIcons[index],
                          onTap: controller.onChangeAppIcon,
                        ),
                        separatorBuilder: (context, index) => sizedBoxW24,
                      ),
                    ),
                  ),
                  sizedBoxH16,
                  CustomCard(
                      child: Column(
                    children: [
                      SettingCell(
                        prefix:
                            SvgPicture.asset('assets/svg/Regular/Database.svg'),
                        label: 'Share Database'.tr,
                        onTap: controller.onTapShareDatabase,
                      ),
                      const CustomDivider(indent: 48),
                      SettingCell(
                        prefix: SvgPicture.asset(
                            'assets/svg/Regular/ClockCounterClockwise.svg'),
                        label: 'Re Generate Events'.tr,
                        onTap: controller.onTapReGenerateEvents,
                      ),
                      const CustomDivider(indent: 48),
                      SettingCell(
                        prefix: SvgPicture.asset(
                            'assets/svg/Regular/LightningSlash.svg'),
                        label: 'Test Crash'.tr,
                        onTap: controller.onTestCrash,
                      ),
                    ],
                  )),
                ],
              ),
            ));
      },
    );
  }
}
