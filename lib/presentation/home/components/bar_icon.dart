import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarIcon extends StatelessWidget {
  const BarIcon({
    super.key,
    required this.path,
    this.colorFilter,
  });

  final String path;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset(
          path,
          colorFilter: colorFilter,
        ));
  }
}
