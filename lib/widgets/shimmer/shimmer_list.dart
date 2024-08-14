import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';

import '../base/base_shimmer.dart';

class ShimmerListWidget extends StatelessWidget {
  const ShimmerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BaseShimmer(child: _Header()),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: context.neutral100),
          child: BaseShimmer(
            child: Column(
              children: [
                const _Cell(
                  flexs: [5, 1, 3],
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 14.0),
                ),
                const _Cell(
                  flexs: [4, 3, 3],
                  padding: EdgeInsets.fromLTRB(16.00, 0.0, 16.0, 16.0),
                ),
                Divider(
                  height: 1,
                  color: context.neutral300,
                  indent: 16.0,
                  endIndent: 16.0,
                ),
                const _Cell(
                  flexs: [5, 1, 3],
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 14.0),
                ),
                const _Cell(
                  flexs: [4, 3, 3],
                  padding: EdgeInsets.fromLTRB(16.00, 0.0, 16.0, 16.0),
                ),
                Divider(
                  height: 1,
                  color: context.neutral300,
                  indent: 16.0,
                  endIndent: 16.0,
                ),
                const _Cell(
                  flexs: [5, 1, 3],
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 14.0),
                ),
                const _Cell(
                  flexs: [4, 3, 3],
                  padding: EdgeInsets.fromLTRB(16.00, 0.0, 16.0, 16.0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    required this.flexs,
    required this.padding,
  });
  final List<int> flexs;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    return Padding(
      padding: padding,
      child: Row(children: [
        Expanded(
          flex: flexs[0],
          child: Container(
            width: double.infinity,
            height: 24,
            decoration: const BoxDecoration(
              borderRadius: borRad08,
              color: color,
            ),
          ),
        ),
        Spacer(flex: flexs[1]),
        Expanded(
          flex: flexs[2],
          child: Container(
            width: double.infinity,
            height: 24,
            decoration: const BoxDecoration(
              borderRadius: borRad08,
              color: color,
            ),
          ),
        ),
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration:
          BoxDecoration(color: context.neutral100, borderRadius: borRad08),
      height: 27,
      width: 150,
    );
  }
}
