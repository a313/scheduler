import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final bool isActive;
  const SizeAnimation(
      {Key? key,
      required this.duration,
      required this.child,
      this.isActive = false})
      : super(key: key);

  @override
  State<SizeAnimation> createState() => _State();
}

class _State extends State<SizeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late final Animation<double> _doubleAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _controller.value = widget.isActive ? 1 : 0;
  }

  @override
  void didUpdateWidget(covariant SizeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) _controller.forward();
      if (!widget.isActive) _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _doubleAnimation,
      axis: Axis.vertical,
      axisAlignment: -1,
      child: widget.child,
    );
  }
}
