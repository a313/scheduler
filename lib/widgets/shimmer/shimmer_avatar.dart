import 'package:flutter/material.dart';

import '../base/base_shimmer.dart';

class ShimmerAvatar extends StatelessWidget {
  const ShimmerAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseShimmer(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    ));
  }
}
