import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../base/base_shimmer.dart';

class ShimmerTable extends StatelessWidget {
  const ShimmerTable({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return BaseShimmer(
        child: ListView.separated(
            itemCount: itemCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => sizedBoxH14,
            itemBuilder: (context, index) => const _Cell()));
  }
}

class _Cell extends StatelessWidget {
  const _Cell();

  @override
  Widget build(BuildContext context) {
    final random = Random().nextInt(6);
    return Row(
      children: [
        Expanded(
          flex: 2 + random,
          child: Container(
            height: 18,
            color: context.neutral200,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 8 - random,
          child: Container(
            height: 18,
            color: context.neutral200,
          ),
        ),
      ],
    );
  }
}
