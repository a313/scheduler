import 'package:flutter/material.dart';

class BottomPattern extends StatelessWidget {
  const BottomPattern({
    Key? key,
    required this.child,
  }) : super(key: key);
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
