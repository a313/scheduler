import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../base/base_scafold_appbar.dart';
import '../base/base_state_widget.dart';
import 'search_field.dart';

class BaseSearchPage<T> extends StatefulWidget {
  const BaseSearchPage({
    Key? key,
    required this.title,
    this.hintText = 'Tìm kiếm',
    required this.options,
    required this.itemBuilder,
    required this.searchBy,
    this.onSearchEmpty,
  }) : super(key: key);

  final String title;
  final String hintText;
  final List<T> options;
  final Widget Function(BuildContext context, T obj) itemBuilder;
  final Widget Function(BuildContext context)? onSearchEmpty;
  final bool Function(T element, String value) searchBy;

  @override
  State<BaseSearchPage<T>> createState() => _BaseSearchPageState<T>();
}

class _BaseSearchPageState<T> extends State<BaseSearchPage<T>> {
  List<T> filtedData = [];
  late TextEditingController controller;

  @override
  void initState() {
    filtedData = List.from(widget.options);
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
                  itemBuilder: (context, index) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => onSelected(filtedData[index]),
                      child: widget.itemBuilder(context, filtedData[index]))),
            ))
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

  void onSelected(T selected) {
    Navigator.of(context).pop(selected);
  }
}
