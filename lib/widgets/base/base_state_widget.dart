import 'package:flutter/material.dart';

enum WidgetState { loading, success, empty, error }

class BaseStateWidget extends StatelessWidget {
  const BaseStateWidget({
    super.key,
    required this.builder,
    required this.onLoading,
    this.onEmpty,
    this.onError,
    this.baseColor,
    this.highlightColor,
    this.state = WidgetState.loading,
  });

  final WidgetBuilder builder;
  final Widget onLoading;
  final Widget? onEmpty;
  final Widget? onError;
  final Color? baseColor;
  final Color? highlightColor;
  final WidgetState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case WidgetState.loading:
        return onLoading;
      case WidgetState.success:
        return builder(context);
      case WidgetState.empty:
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
