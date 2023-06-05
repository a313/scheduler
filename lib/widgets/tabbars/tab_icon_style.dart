import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheduler/core/utils/util.dart';

class TabItem {
  final String label;
  final String svgPath;

  TabItem({required this.label, required this.svgPath});
}

class TabBarStyleIcon extends StatelessWidget implements PreferredSizeWidget {
  const TabBarStyleIcon({
    Key? key,
    required this.controller,
    required this.tabs,
    required this.style,
    required this.selectedStyle,
  }) : super(key: key);
  final TabController controller;
  final List<TabItem> tabs;
  final TextStyle style;
  final TextStyle selectedStyle;

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
          child: TabIcon(
            style: style,
            selectedStyle: selectedStyle,
            controler: controller,
            tabs: tabs,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(78.0);
}

class TabIcon extends StatefulWidget {
  const TabIcon({
    Key? key,
    required this.tabs,
    required TabController controler,
    required this.style,
    required this.selectedStyle,
  })  : controller = controler,
        super(key: key);
  final TabController controller;
  final List<TabItem> tabs;
  final TextStyle style;
  final TextStyle selectedStyle;

  @override
  State<TabIcon> createState() => _TabIconState();
}

class _TabIconState extends State<TabIcon> {
  late int _currentIndex;
  @override
  void initState() {
    _currentIndex = widget.controller.index;
    widget.controller.addListener(_handleTabControllerTick);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.tabs.length,
        (index) {
          final isSelected = _currentIndex == index;
          return Expanded(
              child: isSelected
                  ? _Selected(
                      selectedStyle: widget.selectedStyle,
                      item: widget.tabs[index],
                      onTap: () => _handlerTab(index),
                    )
                  : _UnSelected(
                      style: widget.style,
                      item: widget.tabs[index],
                      onTap: () => _handlerTab(index),
                    ));
        },
      ),
    );
  }

  void _handleTabControllerTick() {
    if (widget.controller.index != _currentIndex) {
      _currentIndex = widget.controller.index;
    }
    setState(() {
      // Rebuild the tabs after a (potentially animated) index change
      // has completed.
    });
  }

  _handlerTab(int index) {
    assert(index >= 0 && index < widget.tabs.length);
    widget.controller.animateTo(index);
  }
}

class _UnSelected extends StatelessWidget {
  const _UnSelected({
    Key? key,
    required this.item,
    this.onTap,
    required this.style,
  }) : super(key: key);
  final TabItem item;
  final Function()? onTap;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        children: [
          sizedBoxH08,
          Container(
            padding: padAll08,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: borRad16,
              color: context.neutral200,
            ),
            child: SvgPicture.asset(
              item.svgPath,
              colorFilter: context.neutral700.filterSrcIn,
            ),
          ),
          sizedBoxH08,
          Text(
            item.label,
            maxLines: 1,
            style: style,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}

class _Selected extends StatelessWidget {
  const _Selected({
    Key? key,
    required this.item,
    this.onTap,
    required this.selectedStyle,
  }) : super(key: key);
  final TabItem item;
  final Function()? onTap;

  final TextStyle selectedStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        children: [
          sizedBoxH08,
          Container(
            padding: padAll08,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: borRad16,
              color: context.primaryOrange,
            ),
            child: SvgPicture.asset(
              item.svgPath,
              colorFilter: context.neutral100.filterSrcIn,
            ),
          ),
          sizedBoxH08,
          Text(
            item.label,
            maxLines: 1,
            style: selectedStyle,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
