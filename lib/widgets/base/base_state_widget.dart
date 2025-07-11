import 'package:flutter/material.dart';

enum BaseWidgetState { loading, success, empty, error }

class BaseStateWidget extends StatelessWidget {
  const BaseStateWidget({
    super.key,
    required this.builder,
    required this.onLoading,
    this.onEmpty,
    this.onError,
    this.baseColor,
    this.highlightColor,
    this.state = BaseWidgetState.loading,
  });

  final WidgetBuilder builder;
  final Widget onLoading;
  final Widget? onEmpty;
  final Widget? onError;
  final Color? baseColor;
  final Color? highlightColor;
  final BaseWidgetState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case BaseWidgetState.loading:
        return onLoading;
      case BaseWidgetState.success:
        return builder(context);
      case BaseWidgetState.empty:
        return onEmpty ?? const SizedBox();
      default:
        return onError ?? const SizedBox();
    }
  }
}

typedef WidgetCallback = Widget Function();

class ABWidget extends StatelessWidget {
  final WidgetBuilder widgetA;
  final WidgetBuilder? widgetB;
  final bool isShowA;

  const ABWidget(
      {super.key, required this.widgetA, this.widgetB, this.isShowA = true});
  @override
  Widget build(BuildContext context) {
    if (isShowA) {
      return widgetA(context);
    }
    return widgetB?.call(context) ?? const SizedBox();
  }
}
