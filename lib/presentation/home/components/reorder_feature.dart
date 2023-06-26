import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/feature.dart';

import '../../../theme/app_fonts.dart';
import '../../../widgets/base/base_bottom_sheet.dart';

class ReorderFeatureBottomSheet extends StatefulWidget {
  const ReorderFeatureBottomSheet({
    super.key,
    required this.pin,
    required this.other,
  });

  final List<Feature> pin;
  final List<Feature> other;

  @override
  State<ReorderFeatureBottomSheet> createState() =>
      _ReorderFeatureBottomSheetState();
}

class _ReorderFeatureBottomSheetState extends State<ReorderFeatureBottomSheet> {
  late List<Feature> items;
  late int pinCount;

  @override
  void initState() {
    items = List.from(widget.pin);
    items.addAll(widget.other);

    pinCount = widget.pin.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: Get.back,
            child: const SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
        BaseBottomSheet(
          title: '',
          child: Padding(
            padding: padAll16,
            child: Expanded(
                child: ReorderableListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Text(
                    'Pin to the bottom',
                    key: const Key('Pin to the bottom'),
                    style: AppFonts.bSmall.copyWith(color: context.neutral900),
                  );
                }

                if (index == pinCount) {
                  return Text(
                    'More Feature',
                    key: const Key('More Feature'),
                    style: AppFonts.bSmall.copyWith(color: context.neutral900),
                  );
                }
                final obj = widget.other[index + 1];
                final label = obj.item.label!;
                final icon = obj.item.icon;
                return ListTile(
                  key: Key(label),
                  leading: icon,
                );
              },
              itemCount: widget.other.length + 2,
              shrinkWrap: true,
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = items.removeAt(oldIndex);
                  items.insert(newIndex, item);
                });
              },
            )),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Text(
            //       'Pin to the bottom',
            //       style: AppFonts.bSmall.copyWith(color: context.neutral900),
            //     ),
            //     Text(
            //       'More Feature',
            //       style: AppFonts.bSmall.copyWith(color: context.neutral900),
            //     ),
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}
