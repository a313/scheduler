import 'dart:core';

import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/domain/entities/feature.dart';
import 'package:aio/presentation/clock/clock_page.dart';
import 'package:aio/presentation/hex_to_link/hex_to_link_page.dart';
import 'package:aio/presentation/home/components/more_feature.dart';
import 'package:aio/presentation/lunar/lunar_page.dart';
import 'package:aio/presentation/periods/periods_page.dart';
import 'package:aio/presentation/setting/setting_page.dart';
import 'package:aio/presentation/timetables/timetables_page.dart';
import 'package:aio/widgets/base/keep_alive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../class_room/class_room_page.dart';
import '../events/events_page.dart';
import '../reminder/reminder_page.dart';
import '../report/report_page.dart';
import '../students/students_page.dart';
import 'components/bar_icon.dart';
import 'components/calendar_icon.dart';
import 'components/reorder_feature.dart';

class HomeController extends BaseController with GetTickerProviderStateMixin {
  late TabController tabController;

  final normalColor = Get.context!.neutral600.filterSrcIn;
  final activeColor = Get.context!.primaryDark.filterSrcIn;
  List<Widget> barPages = [];

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
        icon: const CalendarIcon(isActive: false),
        activeIcon: const CalendarIcon(isActive: true),
        label: 'Calendar'.tr,
      ),
      Feature(
          key: reminderPage,
          page: const ReminderPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/Gift.svg', colorFilter: normalColor),
          activeIcon: BarIcon(
              path: 'assets/svg/Regular/Gift.svg', colorFilter: activeColor),
          label: 'Reminder'.tr),
      Feature(
          key: reportPage,
          page: const ReportPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/CurrencyCircleDollar.svg',
              colorFilter: normalColor),
          activeIcon: BarIcon(
            path: 'assets/svg/Regular/CurrencyCircleDollar.svg',
            colorFilter: activeColor,
          ),
          label: 'Report'.tr),

      Feature(
          key: classPage,
          page: const ClassRoomPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/Chalkboard.svg',
              colorFilter: normalColor),
          activeIcon: BarIcon(
            path: 'assets/svg/Regular/Chalkboard.svg',
            colorFilter: activeColor,
          ),
          label: 'Class'.tr),

      Feature(
          key: studentPage,
          page: const StudentsPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/Student.svg', colorFilter: normalColor),
          activeIcon: BarIcon(
            path: 'assets/svg/Regular/Student.svg',
            colorFilter: activeColor,
          ),
          label: 'Student'.tr),

      Feature(
          key: hexPage,
          page: const HexToLinkPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/TerminalWindow.svg',
              colorFilter: normalColor),
          activeIcon: BarIcon(
            path: 'assets/svg/Regular/TerminalWindow.svg',
            colorFilter: activeColor,
          ),
          label: 'Decode'.tr),

      Feature(
          key: timeTablePage,
          page: const TimetablesPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/ChalkboardTeacher.svg',
              colorFilter: normalColor),
          activeIcon: BarIcon(
            path: 'assets/svg/Regular/ChalkboardTeacher.svg',
            colorFilter: activeColor,
          ),
          label: 'Timetable'.tr),

      // Feature(
      //   key: weatherPage,
      //   page: const WeatherPage(),
      //   item: BottomNavigationBarItem(
      //       icon: BarIcon(
      //           path: 'assets/svg/Regular/CloudSun.svg',
      //           colorFilter: normalColor),
      //       activeIcon: BarIcon(
      //         path: 'assets/svg/Regular/CloudSun.svg',
      //         colorFilter: activeColor,
      //       ),
      //       label: 'Weather'.tr),
      // ),
      Feature(
          key: periodsPage,
          page: const PeriodsPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/Heartbeat.svg',
              colorFilter: normalColor),
          activeIcon: BarIcon(
            path: 'assets/svg/Regular/Heartbeat.svg',
            colorFilter: activeColor,
          ),
          label: 'Periods'.tr),

      Feature(
          key: clockPage,
          page: const ClockPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/Clock.svg', colorFilter: normalColor),
          activeIcon: BarIcon(
            path: 'assets/svg/Regular/Clock.svg',
            colorFilter: activeColor,
          ),
          label: 'Clock'.tr),

      // Feature(
      //   key: vpnPage,
      //   page: const VpnPage(),
      //   item: BottomNavigationBarItem(
      //       icon: BarIcon(
      //           path: 'assets/svg/Regular/WifiHigh.svg',
      //           colorFilter: normalColor),
      //       activeIcon: BarIcon(
      //         path: 'assets/svg/Regular/WifiHigh.svg',
      //         colorFilter: activeColor,
      //       ),
      //       label: 'VPN'.tr),
      // ),

      Feature(
          key: lunarPage,
          page: const LunarPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/LunarCalendar.svg',
              colorFilter: normalColor),
          activeIcon: const BarIcon(
            path: 'assets/svg/Regular/LunarCalendarActive.svg',
          ),
          label: 'Lunar'.tr),

      Feature(
          key: settingPage,
          page: const SettingPage(),
          icon: BarIcon(
              path: 'assets/svg/Regular/Gear.svg', colorFilter: normalColor),
          activeIcon: BarIcon(
            path: 'assets/svg/Regular/Gear.svg',
            colorFilter: activeColor,
          ),
          label: 'Setting'.tr),
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

    barPages = pin.map((k) => KeepAliveWrapper(child: k.page)).toList();
    // barItems = pin.map((k) => k.item).toList();
    // final more = BottomNavigationBarItem(
    //     icon: BarIcon(
    //         path: 'assets/svg/Regular/DotsThreeOutline.svg',
    //         colorFilter: normalColor),
    //     activeIcon: BarIcon(
    //         path: 'assets/svg/Regular/DotsThreeOutline.svg',
    //         colorFilter: activeColor),
    //     label: 'More'.tr);
    // barItems.add(more);
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
    // final result =
    //     await Get.to(() => ReorderFeaturePage(pin: pin, other: other));
    // onChangedFeatureOrder(result[0], result[1]);
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
    pin = pinKeys
        .map((pin) => allFeature.firstWhere((f) => pin == f.key))
        .toList();
    other = allFeature.where((e) => !pin.contains(e)).toList();
  }
}
