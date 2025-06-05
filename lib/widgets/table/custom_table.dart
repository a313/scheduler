import 'dart:math';

import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';

import 'custom_title.dart';

class CustomTable extends StatelessWidget {
  final String? title;
  final Widget? header;
  final List<Widget> cells;

  const CustomTable({super.key, this.title, required this.cells, this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) CustomTitle(title!),
        if (header != null) header!,
        sizedBoxH16,
        ...cells
      ],
    );
  }

  CustomTable.separated({
    super.key,
    this.title,
    this.header,
    required int itemCount,
    required Widget Function(int index) separatorBuilder,
    required Widget Function(int index) itemBuilder,
  }) : cells = List.generate(max(0, itemCount * 2 - 1), (index) {
          final int itemIndex = index ~/ 2;
          final Widget widget;
          if (index.isEven) {
            widget = Builder(builder: (context) {
              return itemBuilder(itemIndex);
            });
          } else {
            widget = Builder(builder: (context) {
              return separatorBuilder(itemIndex);
            });
          }
          return widget;
        });
}
