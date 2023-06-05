import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class ViewMoreWidget extends StatefulWidget {
  final WidgetBuilder short;
  final WidgetBuilder long;

  final Function(bool isShowAll)? onTappedShowMore;

  const ViewMoreWidget({
    Key? key,
    required this.short,
    required this.long,
    this.onTappedShowMore,
  }) : super(key: key);

  @override
  State<ViewMoreWidget> createState() => _ViewMoreWidgetState();
}

class _ViewMoreWidgetState extends State<ViewMoreWidget> {
  bool isExpand = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isExpand) widget.short(context),
        if (isExpand) widget.long(context),
        _textWithArrow(),
      ],
    );
  }

  InkWell _textWithArrow() {
    return InkWell(
      onTap: _onToggle,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(isExpand ? "Rút gọn" : "Mở rộng",
                  style: AppFonts.h300.copyWith(color: context.primaryOrange)),
              if (isExpand)
                Icon(Icons.keyboard_arrow_up, color: context.primaryOrange)
              else
                Icon(Icons.keyboard_arrow_down, color: context.primaryOrange)
            ],
          ),
        ),
      ),
    );
  }

  void _onToggle() {
    return setState(() {
      isExpand = !isExpand;
      widget.onTappedShowMore?.call(isExpand);
    });
  }
}
