import 'package:flutter/material.dart';

class BottomPattern extends StatelessWidget {
  const BottomPattern({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/png/img_white_background.png',
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
