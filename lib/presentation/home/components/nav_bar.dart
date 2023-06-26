import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../../theme/app_fonts.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({
    Key? key,
    this.onTap,
    required this.currentIndex,
    required this.items,
  }) : super(key: key);
  final Function(int)? onTap;
  final int currentIndex;
  final List<BottomNavigationBarItem> items;

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
              items: items,
            ),
          ),
        ),
      ],
    );
  }
}
