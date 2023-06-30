import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/widgets/base/base_button.dart';

import '../base/base_scafold_appbar.dart';
import '../base/base_state_widget.dart';
import 'search_field.dart';

class BaseSearchPage<T> extends StatefulWidget {
  const BaseSearchPage({
    Key? key,
    required this.title,
    this.hintText = 'Search',
    required this.options,
    required this.itemBuilder,
    required this.searchBy,
    this.onSearchEmpty,
    this.isMultiSelect = false,
    this.selected,
    this.selectedBuilder,
  }) : super(key: key);

  final bool isMultiSelect;
  final String title;
  final String hintText;
  final List<T>? selected;
  final List<T> options;
  final Widget Function(BuildContext context, T obj) itemBuilder;
  final Widget Function(BuildContext context, T obj)? selectedBuilder;
  final Widget Function(BuildContext context)? onSearchEmpty;
  final bool Function(T element, String value) searchBy;

  @override
  State<BaseSearchPage<T>> createState() => _BaseSearchPageState<T>();
}

class _BaseSearchPageState<T> extends State<BaseSearchPage<T>> {
  List<T> filtedData = [];
  List<T> selected = [];
  late TextEditingController controller;

  @override
  void initState() {
    filtedData = List.from(widget.options);
    selected = List.from(widget.selected ?? []);
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: widget.title,
        body: Column(
          children: [
            sizedBoxH16,
            Padding(
              padding: padSymHor16,
              child: SearchField(
                controller: controller,
                hintText: widget.hintText,
                onChanged: onChanged,
                onClearSearch: onClearSearch,
              ),
            ),
            Expanded(
                child: ABWidget(
              isShowA: filtedData.isNotEmpty || widget.onSearchEmpty == null,
              widgetB: (context) => widget.onSearchEmpty!(context),
              widgetA: (context) => ListView.separated(
                itemCount: filtedData.length,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                separatorBuilder: (c, i) => const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final obj = filtedData[index];
                  final isSelected = selected.contains(obj);
                  Widget child;
                  if (isSelected && widget.selectedBuilder != null) {
                    child = widget.selectedBuilder!(context, obj);
                  } else {
                    child = widget.itemBuilder(context, obj);
                  }
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => onSelected(obj),
                    child: child,
                  );
                },
              ),
            )),
            if (widget.isMultiSelect)
              BaseButton.fixBottom(
                  title: 'Done'.tr,
                  onPressed: () => Navigator.of(context).pop(selected))
          ],
        ));
  }

  void onChanged(String value) {
    setState(() {
      filtedData =
          widget.options.where((e) => widget.searchBy(e, value)).toList();
    });
  }

  void onClearSearch() {
    setState(() {
      filtedData = List.from(widget.options);
    });
  }

  void onSelected(T obj) {
    if (widget.isMultiSelect) {
      setState(() {
        if (selected.contains(obj)) {
          selected.remove(obj);
        } else {
          selected.add(obj);
        }
      });
    } else {
      Navigator.of(context).pop([obj]);
    }
  }
}
