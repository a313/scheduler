import 'package:aio/core/utils/util.dart';
import 'package:aio/domain/entities/feature.dart';
import 'package:aio/presentation/home/components/side_nav_rail.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:aio/widgets/platform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bar_icon.dart';
import 'components/bottom_nav_bar.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return BaseScaffold(
        scaffoldKey: controller.scaffoldKey,
        backgroundColor: context.primaryDark,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: PlatformWidget(
          mobile: BottomNavBar(
            currentIndex: controller.currentIndex,
            onTap: (index) => controller.onChangedTab(context, index),
            items: List.from(controller.pin)
              ..add(Feature(
                  page: const SizedBox(),
                  key: 'more',
                  icon: BarIcon(
                      path: 'assets/svg/Regular/DotsThreeOutline.svg',
                      colorFilter: context.neutral600.filterSrcIn),
                  activeIcon: BarIcon(
                      path: 'assets/svg/Regular/DotsThreeOutline.svg',
                      colorFilter: context.primaryDark.filterSrcIn),
                  label: 'More'.tr)),
          ),
        ),
        body: PlatformWidget(
          mobile: TabBarView(
            controller: controller.tabController,
            children: controller.barPages,
          ),
          desktop: Row(
            children: [
              SideNavRail(
                currentIndex: controller.currentIndex,
                onTap: (index) => controller.onChangedTab(context, index),
                items: controller.pin,
                trailing: Expanded(
                  child: Column(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () =>
                            controller.showAppsBottomSheet(context),
                        icon: BarIcon(
                            path: 'assets/svg/Regular/DotsThreeOutline.svg',
                            colorFilter: context.neutral600.filterSrcIn),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(
                controller: controller.tabController,
                children: controller.barPages,
              ))
            ],
          ),
        ),
      );
    });
  }
}
