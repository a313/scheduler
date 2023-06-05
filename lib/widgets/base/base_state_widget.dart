import 'package:flutter/material.dart';

enum WidgetState { loading, success, empty, error }

class BaseStateWidget extends StatelessWidget {
  const BaseStateWidget({
    Key? key,
    required this.builder,
    required this.onLoading,
    this.onEmpty,
    this.onError,
    this.baseColor,
    this.highlightColor,
    this.state = WidgetState.loading,
  }) : super(key: key);

  final WidgetBuilder builder;
  final WidgetBuilder onLoading;
  final WidgetBuilder? onEmpty;
  final WidgetBuilder? onError;
  final Color? baseColor;
  final Color? highlightColor;
  final WidgetState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case WidgetState.loading:
        return onLoading(context);
      case WidgetState.success:
        return builder(context);
      case WidgetState.empty:
        return onEmpty?.call(context) ?? const SizedBox();
      default:
        return onError?.call(context) ?? const SizedBox();
    }
  }
}

typedef WidgetCallback = Widget Function();

class ABWidget extends StatelessWidget {
  final WidgetBuilder widgetA;
  final WidgetBuilder? widgetB;
  final bool isShowA;

  const ABWidget(
      {Key? key, required this.widgetA, this.widgetB, this.isShowA = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isShowA) {
      return widgetA(context);
    }
    return widgetB?.call(context) ?? const SizedBox();
  }
}
