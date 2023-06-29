import 'package:flutter/material.dart';

import '../../../core/utils/util.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: R1H,
      child: Row(
        children: [
          const Text(' ').size(w: C1W),
          Text(1.getDayOfWeek, textAlign: TextAlign.center).expanded(),
          Text(2.getDayOfWeek, textAlign: TextAlign.center).expanded(),
          Text(3.getDayOfWeek, textAlign: TextAlign.center).expanded(),
          Text(4.getDayOfWeek, textAlign: TextAlign.center).expanded(),
          Text(5.getDayOfWeek, textAlign: TextAlign.center).expanded(),
          Text(6.getDayOfWeek, textAlign: TextAlign.center).expanded(),
          Text(7.getDayOfWeek, textAlign: TextAlign.center).expanded(),
        ],
      ),
    );
  }
}
