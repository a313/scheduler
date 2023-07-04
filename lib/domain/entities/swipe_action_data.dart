import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

class SwipeData {
  final TextStyle style;
  final Color color;
  final Widget? icon;
  final String? title;

  SwipeData(
      {this.style = const TextStyle(fontSize: 14, color: Colors.white),
      this.color = Colors.red,
      this.icon,
      this.title = 'Delete'});
}

class SwipeActionData<T> {
  final SwipeData Function(T data)? styleBuilder;

  final bool closeOnTap;

  final bool forceAlignmentToBoundary;

  final double widthSpace;

  final double backgroundRadius;

  final SwipeNestedAction? nestedAction;

  final Widget? content;

  final bool performsFirstActionWithFullSwipe;
  final Function(T data, Future<void> Function(bool delete) handler) onTap;

  SwipeActionData({
    required this.onTap,
    this.styleBuilder,
    this.closeOnTap = true,
    this.backgroundRadius = 0.0,
    this.forceAlignmentToBoundary = false,
    this.widthSpace = 80,
    this.nestedAction,
    this.content,
    this.performsFirstActionWithFullSwipe = false,
  });

  SwipeAction toAction(T data) {
    final styleData = styleBuilder?.call(data) ?? SwipeData();
    return SwipeAction(
      style: styleData.style,
      closeOnTap: closeOnTap,
      forceAlignmentToBoundary: forceAlignmentToBoundary,
      widthSpace: widthSpace,
      color: styleData.color,
      onTap: (b) {
        onTap(data, b);
      },
      icon: styleData.icon,
      title: styleData.title,
    );
  }
}
