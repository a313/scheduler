import 'package:flutter/material.dart';

import '../base/base_shimmer.dart';

class ShimmerLabel extends StatelessWidget {
  const ShimmerLabel({Key? key, this.height = 21, this.width = 140})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return BaseShimmer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        height: height,
        width: width,
      ),
    );
  }
}
