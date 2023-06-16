import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import '../base/base_bottom_sheet.dart';
import '../base/base_button.dart';

class SelectBottomSheet<T> extends StatefulWidget {
  const SelectBottomSheet(
      {super.key,
      required this.title,
      this.initValue,
      required this.options,
      required this.itemBuilder,
      this.selectedBuilder,
      this.isMultiSelect = false})
      : assert((isMultiSelect && selectedBuilder != null) || !isMultiSelect);
  final String title;
  final bool isMultiSelect;
  final List<T>? initValue;
  final List<T> options;
  final Widget Function(BuildContext context, T obj) itemBuilder;
  final Widget Function(BuildContext context, T obj)? selectedBuilder;

  @override
  State<SelectBottomSheet<T>> createState() => _SelectBottomSheetState<T>();
}

class _SelectBottomSheetState<T> extends State<SelectBottomSheet<T>> {
  List<T> selected = [];

  @override
  void initState() {
    selected = List.from(widget.initValue ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final options = widget.options;
    return BaseBottomSheet(
        title: widget.title,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: widget.options.length,
              separatorBuilder: (context, index) => const CustomDivider(),
              itemBuilder: (context, index) {
                Widget child;
                final obj = options[index];
                final isSelect = selected.contains(obj);
                if (isSelect) {
                  child = widget.selectedBuilder!(context, obj);
                } else {
                  child = widget.itemBuilder(context, obj);
                }

                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => onSelect(obj),
                  child: child,
                );
              },
            ),
            BaseButton.fixBottom(
                title: 'Done',
                onPressed: () {
                  Get.back(result: selected);
                })
          ],
        ));
  }

  void onSelect(T obj) {
    if (widget.isMultiSelect) {
      if (selected.contains(obj)) {
        selected.remove(obj);
      } else {
        selected.add(obj);
      }
    } else {
      selected = [obj];
    }
    setState(() {});
  }
}
