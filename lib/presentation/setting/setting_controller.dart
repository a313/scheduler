import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/app_icon.dart';
import 'package:scheduler/presentation/events/events_controller.dart';
import 'package:scheduler/widgets/base/base_bottom_sheet.dart';
import 'package:scheduler/widgets/custom_divider.dart';
import 'package:scheduler/widgets/selectable_cell.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/usecases/event_usecases.dart';
import '../../routes/routes.dart';
import '../../widgets/popups/two_option_popup.dart';

class SettingController extends BaseController {
  final iconChannels = const MethodChannel('schedule/tools');

  late List<AppIconData> appIcons;
  String get language {
    final lang = local.getLanguage();
    return lang ?? 'sys';
  }

  String get theme {
    return local.getThemeMode().name.capitalizeFirst!;
  }

  @override
  void onInit() {
    appIcons = [
      AppIconData('Gạo1', 'assets/png/appIcons/app_icon.jpg', 'icon1'),
      AppIconData('Anya', 'assets/png/appIcons/app_icon2.jpg', 'icon3'),
      AppIconData('Test', 'assets/png/appIcons/app_icon3.jpeg', 'icon2'),
    ];
    super.onInit();
  }

  void onTapSchedule() {
    Get.toNamed(Routes.schedule);
  }

  Future<void> onTapLanguage() async {
    final curLang = local.getLanguage();

    final result = await bottomSheet(BaseBottomSheet(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectableCell(
          label: 'System',
          onTap: () => Get.back(result: 'sys'),
          isSelected: curLang == 'sys',
        ),
        SelectableCell(
          label: 'English',
          onTap: () => Get.back(result: 'en'),
          isSelected: curLang == 'en',
        ),
        SelectableCell(
          label: 'Tiếng việt',
          onTap: () => Get.back(result: 'vi'),
          isSelected: curLang == 'vi',
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
      await local.savedThemeMode(result);
      await Get.forceAppUpdate();
      update();
      await dur150.delay();
      await Get.forceAppUpdate();
      update();
    }
  }

  Future<void> changeAppIcon(String name) async {
    await iconChannels.invokeMethod('changeIcon', {'selectedIcon': name});
  }

  Future<void> onChangeAppIcon(AppIconData data) async {
    await changeAppIcon(data.iconName);
  }

  Future<void> onTapShareDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app_database.db');
    final file = XFile(path);
    final DateTime now = DateTime.now();
    Share.shareXFiles([file], text: 'DB_BACKUP_${now.toIso8601String()}');
  }

  void onTapReGenerateEvents() {
    showPopup(
      TwoOptionPopup(
        desc: 'Are your sure to re create events?',
        secondaryTitle: "I'm sure",
        onSecondary: () async {
          Get.back();
          showLoading();
          await reGenerateEvent();
          dismissLoading();
        },
        primaryTitle: 'Cancel',
        onPrimary: () {
          Get.back();
        },
      ),
    );
  }

  Future<void> reGenerateEvent() async {
    final from = DateTime.now().dateWithoutTime();

    local.savedLastGenerateTime(from);
    final useCases = Get.find<EventUseCases>();
    await useCases.removeEvents(
      from: from,
      to: DateTime(2300),
    );

    await Get.find<EventsController>().handlerEvents();
  }

  void onTestCrash() {
    showSnackBar('throw Exception(${DateTime.now().toIso8601String()})');
    throw Exception(DateTime.now().toIso8601String());
  }
}
