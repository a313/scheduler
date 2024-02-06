import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../animations/size_animation.dart';

class ExpandAnimation extends StatefulWidget {
  const ExpandAnimation({
    super.key,
    this.initExpand = true,
    required this.child,
    required this.header,
    this.duration = dur500,
  });
  final bool initExpand;
  final Widget child;
  final Widget header;
  final Duration duration;

  @override
  State<ExpandAnimation> createState() => _ExpandAnimationState();
}

class _ExpandAnimationState extends State<ExpandAnimation> {
  late bool isExpand;

  @override
  void initState() {
    isExpand = widget.initExpand;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: widget.header),
            IconButton(
                onPressed: () {
                  setState(() {
                    isExpand = !isExpand;
                  });
                },
                icon: isExpand
                    ? const Icon(Icons.keyboard_arrow_up)
                    : const Icon(Icons.keyboard_arrow_down))
          ],
        ),
        SizeAnimation(
          duration: widget.duration,
          isActive: isExpand,
          child: widget.child,
        ),
      ],
    );
  }
}
