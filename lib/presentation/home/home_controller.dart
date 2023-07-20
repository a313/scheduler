import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/feature.dart';
import 'package:scheduler/presentation/hex_to_link/hex_to_link_page.dart';
import 'package:scheduler/presentation/home/components/more_feature.dart';
import 'package:scheduler/presentation/home/components/reorder_feature.dart';
import 'package:scheduler/presentation/periods/periods_page.dart';
import 'package:scheduler/presentation/qrcode/qrcode_page.dart';
import 'package:scheduler/presentation/setting/setting_page.dart';
import 'package:scheduler/presentation/timetables/timetables_page.dart';
import 'package:scheduler/presentation/weather/weather_page.dart';

import '../class_room/class_room_page.dart';
import '../events/events_page.dart';
import '../reminder/reminder_page.dart';
import '../report/report_page.dart';
import '../students/students_page.dart';
import 'components/bar_icon.dart';
import 'components/calendar_icon.dart';

class HomeController extends BaseController with GetTickerProviderStateMixin {
  late TabController tabController;

  final normalColor = Get.context!.neutral600.filterSrcIn;
  final activeColor = Get.context!.primaryDark.filterSrcIn;
  List<Widget> barPages = [];
  List<BottomNavigationBarItem> barItems = [];

  int currentIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Feature> allFeature;

  List<Feature> pin = [];
  List<Feature> other = [];

  late PersistentBottomSheetController? bottomSheetController;
  @override
  void onInit() {
    allFeature = [
      Feature(
        key: eventPage,
        page: const EventsPage(),
        item: BottomNavigationBarItem(
            icon: const CalendarIcon(isActive: false),
            activeIcon: const CalendarIcon(isActive: true),
            label: 'Calendar'.tr),
      ),
      Feature(
        key: reminderPage,
        page: const ReminderPage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/Gift.svg', colorFilter: normalColor),
            activeIcon: BarIcon(
                path: 'assets/svg/Regular/Gift.svg', colorFilter: activeColor),
            label: 'Reminder'.tr),
      ),
      Feature(
        key: reportPage,
        page: const ReportPage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/CurrencyCircleDollar.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/CurrencyCircleDollar.svg',
              colorFilter: activeColor,
            ),
            label: 'Report'.tr),
      ),
      Feature(
        key: classPage,
        page: const ClassRoomPage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/Chalkboard.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/Chalkboard.svg',
              colorFilter: activeColor,
            ),
            label: 'Class'.tr),
      ),
      Feature(
        key: studentPage,
        page: const StudentsPage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/Student.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/Student.svg',
              colorFilter: activeColor,
            ),
            label: 'Student'.tr),
      ),
      Feature(
        key: hexPage,
        page: const HexToLinkPage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/TerminalWindow.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/TerminalWindow.svg',
              colorFilter: activeColor,
            ),
            label: 'Decode'.tr),
      ),
      Feature(
        key: timeTablePage,
        page: const TimetablesPage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/ChalkboardTeacher.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/ChalkboardTeacher.svg',
              colorFilter: activeColor,
            ),
            label: 'Timetable'.tr),
      ),
      Feature(
        key: qrPage,
        page: const QrcodePage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/QrCode.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/QrCode.svg',
              colorFilter: activeColor,
            ),
            label: 'QrCode'.tr),
      ),
      Feature(
        key: weatherPage,
        page: const WeatherPage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/CloudSun.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/CloudSun.svg',
              colorFilter: activeColor,
            ),
            label: 'Weather'.tr),
      ),
      Feature(
        key: periodsPage,
        page: const PeriodsPage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/Heartbeat.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/Heartbeat.svg',
              colorFilter: activeColor,
            ),
            label: 'Periods'.tr),
      ),
      Feature(
        key: settingPage,
        page: const SettingPage(),
        item: BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/Gear.svg', colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/Gear.svg',
              colorFilter: activeColor,
            ),
            label: 'Setting'.tr),
      ),
    ];
    getFeature(pinKeys: local.getPinFeatures());
    updateHome();

    super.onInit();
  }

  void onChangedTab(BuildContext context, int index) {
    if (currentIndex == index) return;
    if (currentIndex == tabController.length) Get.back();
    currentIndex = index;
    update();
    if (index < tabController.length) {
      tabController.animateTo(index);
    } else {
      showAppsBottomSheet(context);
    }
  }

  void updateHome() {
    tabController = TabController(length: pin.length, vsync: this);
    tabController.addListener(() {
      currentIndex = tabController.index;
      update();
    });

    barPages = pin.map((k) => k.page).toList();
    barItems = pin.map((k) => k.item).toList();
    final more = BottomNavigationBarItem(
        icon: BarIcon(
            path: 'assets/svg/Regular/DotsThreeOutline.svg',
            colorFilter: normalColor),
        activeIcon: BarIcon(
            path: 'assets/svg/Regular/DotsThreeOutline.svg',
            colorFilter: activeColor),
        label: 'More'.tr);
    barItems.add(more);
    update();
  }

  Future<void> showAppsBottomSheet(BuildContext context) async {
    scaffoldKey.currentState
        ?.showBottomSheet(
            (_) => MoreFeatureBottomSheet(
                  feature: other,
                  onTappedFeature: onTappedFeature,
                  reOrder: () {
                    Get.back();
                    reOrderFeature();
                  },
                ),
            backgroundColor: Colors.black26)
        .closed
        .whenComplete(() {
      currentIndex = tabController.index;
      update();
    });
  }

  Future<void> reOrderFeature() async {
    await bottomSheet(ReorderFeatureBottomSheet(
      pin: pin,
      other: other,
      onChanged: onChangedFeatureOrder,
    ));

    updateHome();
  }

  Future<void> onTappedFeature(Feature feature) async {
    Get.back();
    await Get.to(() => feature.page);
    update();
  }

  void onChangedFeatureOrder(List<Feature> pin, List<Feature> other) {
    this.pin = pin;
    this.other = other;
    local.savedPinFeatures(pin.map((e) => e.key).toList());
  }

  void getFeature({required List<String> pinKeys}) {
    pin = allFeature.where((e) => pinKeys.contains(e.key)).toList();
    other = allFeature.where((e) => !pin.contains(e)).toList();
  }
}
