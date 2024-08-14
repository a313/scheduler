import 'package:flutter/material.dart';
import 'package:aio/domain/entities/feature.dart';

class SideNavRail extends StatelessWidget {
  const SideNavRail({
    super.key,
    this.onTap,
    required this.currentIndex,
    required this.items,
    this.trailing,
  });
  final Function(int)? onTap;
  final int currentIndex;
  final List<Feature> items;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      elevation: 1,
      trailing: trailing,
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      labelType: NavigationRailLabelType.all,
      minWidth: 80,
      destinations: items
          .map((e) => NavigationRailDestination(
              icon: e.icon, selectedIcon: e.activeIcon, label: Text(e.label)))
          .toList(),
    );
  }
}
