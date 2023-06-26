import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/feature.dart';
import 'package:scheduler/presentation/hex_to_link/hex_to_link_page.dart';
import 'package:scheduler/presentation/home/components/more_feature.dart';
import 'package:scheduler/presentation/home/components/reorder_feature.dart';

import '../class_room/class_room_page.dart';
import '../events/events_page.dart';
import '../reminder/reminder_page.dart';
import '../report/report_page.dart';
import '../students/students_page.dart';
import 'components/bar_icon.dart';
import 'components/calendar_icon.dart';

const eventPage = 'EVENT_PAGE';
const reminderPage = 'REMINDER_PAGE';
const reportPage = 'REPORT_PAGE';
const classPage = 'CLASS_PAGE';
const studentPage = 'STUDENT_PAGE';
const hexPage = 'HEX_PAGE';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  late List<String> pages;
  final normalColor = Get.context!.neutral600.filterSrcIn;
  final activeColor = Get.context!.primaryDark.filterSrcIn;
  List<Widget> barPages = [];
  List<BottomNavigationBarItem> barItems = [];

  int currentIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  late Map<String, Feature> allFeature;

  late PersistentBottomSheetController? bottomSheetController;
  @override
  void onInit() {
    allFeature = {
      eventPage: Feature(
        const EventsPage(),
        const BottomNavigationBarItem(
            icon: CalendarIcon(isActive: false),
            activeIcon: CalendarIcon(isActive: true),
            label: 'Calendar'),
      ),
      reminderPage: Feature(
        const ReminderPage(),
        BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/Gift.svg', colorFilter: normalColor),
            activeIcon: BarIcon(
                path: 'assets/svg/Regular/Gift.svg', colorFilter: activeColor),
            label: 'Reminder'),
      ),
      reportPage: Feature(
        const ReportPage(),
        BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/CurrencyCircleDollar.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/CurrencyCircleDollar.svg',
              colorFilter: activeColor,
            ),
            label: 'Report'),
      ),
      classPage: Feature(
        const ClassRoomPage(),
        BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/Chalkboard.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/Chalkboard.svg',
              colorFilter: activeColor,
            ),
            label: 'Class'),
      ),
      studentPage: Feature(
        const StudentsPage(),
        BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/Student.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/Student.svg',
              colorFilter: activeColor,
            ),
            label: 'Student'),
      ),
      hexPage: Feature(
        const HexToLinkPage(),
        BottomNavigationBarItem(
            icon: BarIcon(
                path: 'assets/svg/Regular/TerminalWindow.svg',
                colorFilter: normalColor),
            activeIcon: BarIcon(
              path: 'assets/svg/Regular/TerminalWindow.svg',
              colorFilter: activeColor,
            ),
            label: 'Decode'),
      )
    };
    updatePage(local.getRecentPage() ?? [eventPage, reminderPage, reportPage]);
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

  void updatePage(List<String> newPages) {
    pages = newPages;
    tabController = TabController(length: pages.length, vsync: this);
    barPages = pages.map((e) => allFeature[e]!.page).toList();
    barItems = pages.map((e) => allFeature[e]!.item).toList();
    final more = BottomNavigationBarItem(
        icon: BarIcon(
            path: 'assets/svg/Regular/DotsThreeOutline.svg',
            colorFilter: normalColor),
        activeIcon: BarIcon(
            path: 'assets/svg/Regular/DotsThreeOutline.svg',
            colorFilter: activeColor),
        label: 'More');
    barItems.add(more);

    update();
  }

  Future<void> showAppsBottomSheet(BuildContext context) async {
    List<Feature> otherFeature = [];
    allFeature.forEach((key, value) {
      if (!pages.contains(key)) {
        otherFeature.add(value);
      }
    });

    scaffoldKey.currentState
        ?.showBottomSheet(
            (_) => MoreFeatureBottomSheet(
                  feature: otherFeature,
                  onTappedFeature: onTappedFeature,
                  reOrder: reOrderFeature,
                ),
            backgroundColor: Colors.black26)
        .closed
        .whenComplete(() {
      currentIndex = tabController.index;
      update();
    });
  }

  void reOrderFeature() {
    final pin = pages.map((e) => allFeature[e]!).toList();
    List<Feature> other = [];
    allFeature.forEach((key, value) {
      if (!pages.contains(key)) {
        other.add(value);
      }
    });
    scaffoldKey.currentState
        ?.showBottomSheet(
            (_) => ReorderFeatureBottomSheet(pin: pin, other: other),
            backgroundColor: Colors.black26)
        .closed
        .whenComplete(() {
      currentIndex = tabController.index;
      update();
    });
  }

  Future<void> onTappedFeature(Feature feature) async {
    Get.back();
    await Get.to(feature.page);
    update();
  }
}
