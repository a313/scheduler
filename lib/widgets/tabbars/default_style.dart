import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/theme/app_fonts.dart';

class TabBarStyleDefault extends StatelessWidget
    implements PreferredSizeWidget {
  const TabBarStyleDefault({
    super.key,
    required this.controller,
    required this.tabs,
  });
  final TabController controller;
  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFEBECED)),
            ),
          ),
          height: 48.0,
          child: TabBar(
              controller: controller,
              indicatorColor: context.primaryDark,
              indicatorPadding: EdgeInsets.zero,
              labelStyle: AppFonts.h300,
              labelColor: context.primaryDark,
              unselectedLabelColor: context.neutral800,
              unselectedLabelStyle: AppFonts.h300,
              tabs: tabs)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}
