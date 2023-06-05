import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/constants/durations.dart';

class SwapCell extends StatelessWidget {
  const SwapCell(
      {Key? key,
      required this.childA,
      required this.childB,
      required this.isShowA})
      : super(key: key);
  final Widget childA;
  final Widget childB;
  final bool isShowA;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: childA,
      secondChild: childB,
      crossFadeState:
          isShowA ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: dur300,
    );
  }
}
