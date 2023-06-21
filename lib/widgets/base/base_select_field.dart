import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottomsheets/select_bottomsheet.dart';
import 'base_input.dart';

class BaseSelectField<T> extends StatefulWidget {
  const BaseSelectField(
      {super.key,
      this.isMultiSelect = false,
      required this.onSelected,
      required this.labelText,
      this.initValue,
      required this.options,
      required this.itemBuilder,
      this.selectedBuilder,
      required this.valueBuilder});
  final List<T>? initValue;
  final List<T> options;
  final bool isMultiSelect;
  final Function(List<T>?) onSelected;
  final String labelText;
  final Widget Function(BuildContext context, T obj) itemBuilder;
  final Widget Function(BuildContext context, T obj)? selectedBuilder;
  final String Function(List<T>? values) valueBuilder;

  @override
  State<BaseSelectField<T>> createState() => _BaseSelectFieldState<T>();
}

class _BaseSelectFieldState<T> extends State<BaseSelectField<T>> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.valueBuilder(widget.initValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openBottomSheet,
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        ignoring: true,
        child: BaseTextField(
          labelText: widget.labelText,
          controller: controller,
        ),
      ),
    );
  }

  Future<void> openBottomSheet() async {
    final value = await Get.bottomSheet<List<T>?>(
      SelectBottomSheet(
        initValue: widget.initValue,
        options: widget.options,
        itemBuilder: widget.itemBuilder,
        selectedBuilder: widget.selectedBuilder,
        title: widget.labelText,
        isMultiSelect: widget.isMultiSelect,
      ),
      useRootNavigator: true,
      isScrollControlled: true,
    );
    if (value != null) {
      controller.text = widget.valueBuilder(value);
      widget.onSelected(value);
    }
  }
}
