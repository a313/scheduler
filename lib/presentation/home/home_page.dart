import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/class_room/class_room_page.dart';
import 'package:scheduler/presentation/events/events_page.dart';
import 'package:scheduler/presentation/reminder/reminder_page.dart';
import 'package:scheduler/presentation/report/report_page.dart';
import 'package:scheduler/presentation/students/students_page.dart';

import '../../theme/app_fonts.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) => _MainNavBar(
          currentIndex: controller.tabController.index,
          onTap: controller.onChangedTab,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          EventsPage(),
          ReminderPage(),
          ReportPage(),
          ClassRoomPage(),
          StudentsPage(),
          // HexToLinkPage(),
        ],
      ),
    );
  }
}

class _MainNavBar extends StatelessWidget {
  const _MainNavBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);
  final Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          color: context.neutral300,
        ),
        BottomAppBar(
          child: Theme(
            data: Theme.of(context).copyWith(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: context.primaryDark,
              unselectedItemColor: context.neutral600,
              selectedLabelStyle: AppFonts.h100,
              unselectedLabelStyle: AppFonts.h100,
              backgroundColor: context.neutral100,
              currentIndex: currentIndex,
              onTap: onTap,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              items: [
                const BottomNavigationBarItem(
                    icon: CalendarIcon(isActive: false),
                    activeIcon: CalendarIcon(isActive: true),
                    label: 'Calendar'),
                BottomNavigationBarItem(
                    icon: BarIcon(
                        path: 'assets/svg/Regular/Gift.svg',
                        colorFilter: context.neutral600.filterSrcIn),
                    activeIcon: BarIcon(
                      path: 'assets/svg/Regular/Gift.svg',
                      colorFilter: context.primaryDark.filterSrcIn,
                    ),
                    label: 'Reminder'),
                BottomNavigationBarItem(
                    icon: BarIcon(
                        path: 'assets/svg/Regular/CurrencyCircleDollar.svg',
                        colorFilter: context.neutral600.filterSrcIn),
                    activeIcon: BarIcon(
                      path: 'assets/svg/Regular/CurrencyCircleDollar.svg',
                      colorFilter: context.primaryDark.filterSrcIn,
                    ),
                    label: 'Report'),
                BottomNavigationBarItem(
                    icon: BarIcon(
                        path: 'assets/svg/Regular/Chalkboard.svg',
                        colorFilter: context.neutral600.filterSrcIn),
                    activeIcon: BarIcon(
                      path: 'assets/svg/Regular/Chalkboard.svg',
                      colorFilter: context.primaryDark.filterSrcIn,
                    ),
                    label: 'Class'),
                BottomNavigationBarItem(
                    icon: BarIcon(
                        path: 'assets/svg/Regular/Student.svg',
                        colorFilter: context.neutral600.filterSrcIn),
                    activeIcon: BarIcon(
                      path: 'assets/svg/Regular/Student.svg',
                      colorFilter: context.primaryDark.filterSrcIn,
                    ),
                    label: 'Student'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CalendarIcon extends StatelessWidget {
  const CalendarIcon({
    super.key,
    required this.isActive,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final day = now.day.toString();

    return Stack(
      children: [
        Container(
          width: 24,
          margin: const EdgeInsets.only(bottom: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(
              color: isActive ? context.primaryDark : context.neutral600,
              width: 1.5,
            ),
            color: isActive ? context.primaryDark : context.neutral100,
          ),
          child: Column(
            children: [
              const SizedBox(height: 6),
              Text(
                day,
                style: AppFonts.h100.copyWith(
                    fontSize: 13,
                    color: isActive ? context.neutral100 : context.neutral600),
              ),
            ],
          ),
        ),
        Positioned(
            top: 6,
            child: Container(
              width: 24,
              height: 1.5,
              color: isActive ? context.neutral100 : context.neutral600,
            ))
      ],
    );
  }
}

class BarIcon extends StatelessWidget {
  const BarIcon({
    Key? key,
    required this.path,
    this.colorFilter,
  }) : super(key: key);

  final String path;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: SvgPicture.asset(
        path,
        colorFilter: colorFilter,
      ),
    );
  }
}
