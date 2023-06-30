import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/presentation/setting/components/setting_cell.dart';
import 'package:scheduler/routes/routes.dart';
import 'package:scheduler/widgets/base/base_bottom_sheet.dart';
import 'package:scheduler/widgets/custom_divider.dart';
import 'package:scheduler/widgets/selectable_cell.dart';

class SettingController extends BaseController {
  String get language {
    final lang = local.getLanguage();
    return lang ?? 'sys';
  }

  String get theme {
    return local.getThemeMode().name.capitalizeFirst!;
  }

  void onTapSchedule() {
    Get.toNamed(Routes.schedule);
  }

  Future<void> onTapLanguage() async {
    final curLang = local.getLanguage();
    const selectIcon = Icon(Icons.check);
    const unSelectIcon = Icon(Icons.check, color: Colors.transparent);
    final result = await bottomSheet(BaseBottomSheet(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SettingCell(
          label: 'System',
          onTap: () => Get.back(result: 'sys'),
          suffix: curLang == null ? selectIcon : unSelectIcon,
        ),
        SettingCell(
          label: 'English',
          onTap: () => Get.back(result: 'en'),
          suffix: curLang == 'en' ? selectIcon : unSelectIcon,
        ),
        SettingCell(
          label: 'Tiếng việt',
          onTap: () => Get.back(result: 'vi'),
          suffix: curLang == 'vi' ? selectIcon : unSelectIcon,
        ),
      ],
    )));
    if (result != null) {
      Locale locale;
      if (result == 'sys') {
        locale = Get.deviceLocale!;
        local.savedLanguage(null);
      } else {
        locale = Locale(result);
        local.savedLanguage(locale.toString());
      }
      updateLocale(locale);
    }
  }

  Future<void> onTapAppearance() async {
    final currentMode = local.getThemeMode();
    final result = await bottomSheet(BaseBottomSheet(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectableCell(
          label: 'System',
          onTap: () => Get.back(result: ThemeMode.system),
          isSelected: currentMode == ThemeMode.system,
        ),
        const CustomDivider(),
        SelectableCell(
          label: 'Light theme',
          onTap: () => Get.back(result: ThemeMode.light),
          isSelected: currentMode == ThemeMode.light,
        ),
        const CustomDivider(),
        SelectableCell(
          label: 'Dark theme',
          onTap: () => Get.back(result: ThemeMode.dark),
          isSelected: currentMode == ThemeMode.dark,
        ),
      ],
    ).paddingOnly(left: 16)));
    if (result != null) {
      local.savedThemeMode(result);
      Get.changeThemeMode(result);
      update();
    }
  }
}
