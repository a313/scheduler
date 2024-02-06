import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

class CustomHorizontalScrollbar extends StatefulWidget {
  const CustomHorizontalScrollbar({
    super.key,
    required this.controller,
    required this.child,
    this.indicatorPadding = 16.0,
  });
  final Widget child;
  final ScrollController controller;

  final double indicatorPadding;

  @override
  State<CustomHorizontalScrollbar> createState() =>
      _CustomHorizontalScrollbarState();
}

class _CustomHorizontalScrollbarState extends State<CustomHorizontalScrollbar> {
  double percent = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: onScroll,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.child,
          SizedBox(
            height: widget.indicatorPadding,
          ),
          Container(
            width: 44,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: borRad24, color: context.neutral300),
            child: Container(
              margin: EdgeInsets.only(
                  left: percent * 24, right: (1 - percent) * 24),
              height: 4,
              decoration: BoxDecoration(
                  borderRadius: borRad24, color: context.primaryDark),
            ),
          ),
        ],
      ),
    );
  }

  bool onScroll(Notification notification) {
    if (!widget.controller.hasClients) return false;
    final max = widget.controller.position.maxScrollExtent;
    final position = widget.controller.offset;

    setState(() {
      percent = (position / max).clamp(0, 1);
    });
    return true;
  }
}
