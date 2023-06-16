import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class AmountHelperComponent extends StatelessWidget {
  const AmountHelperComponent({
    Key? key,
    this.onTapped,
    required this.amount,
    required this.minAmount,
    required this.maxAmount,
    required this.multiStep,
  }) : super(key: key);

  final int amount;
  final int minAmount;
  final int maxAmount;
  final int multiStep;
  final Function(int)? onTapped;

  @override
  Widget build(BuildContext context) {
    final max = (amount * multiStep.toInt()).clamp(0, maxAmount);
    const targetTextStyle = AppFonts.h300;
    int targetTextSize = 14;
    final itemMaxWidth = context.screenSize.width / 3 - 2 - 8.0;
    for (var textSize = targetTextSize; textSize >= 8; textSize--) {
      final renderWidth = max
          .toCurrency(symbol: "")
          .textSize(
              style: targetTextStyle.copyWith(fontSize: textSize.toDouble()))
          .width;

      if (renderWidth < itemMaxWidth) {
        targetTextSize = textSize;
        break;
      }
    }

    return Container(
      color: const Color(0xFFFFFFFF),
      height: 50,
      child: ListView.separated(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (c, index) => const VerticalDivider(
          endIndent: 8,
          indent: 8,
          color: Colors.black26,
          width: 1,
        ),
        itemBuilder: (context, index) {
          final m = amount * multiStep * index;
          if (m > maxAmount) return const SizedBox();
          return _AmountHelper(
            amount: m,
            textStyle:
                targetTextStyle.copyWith(fontSize: targetTextSize.toDouble()),
            onTapped: () => onTapped?.call(m),
          );
        },
      ),
    );
  }
}

class _AmountHelper extends StatelessWidget {
  const _AmountHelper(
      {Key? key, required this.amount, this.onTapped, required this.textStyle})
      : super(key: key);
  final int amount;
  final TextStyle textStyle;
  final VoidCallback? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTapped?.call(),
      child: SizedBox(
        width: context.screenSize.width / 3 - 2,
        child: Padding(
          padding: padSymHor04,
          child: Center(
            child: Text(
              amount.toCurrency(symbol: ""),
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
