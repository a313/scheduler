import 'package:flutter/material.dart';

import '../../../core/utils/util.dart';
import '../../../domain/entities/app_icon.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.data, this.onTap});

  final AppIconData data;
  final Function(AppIconData data)? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(data),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: borRad08,
            child: Image.asset(
              data.path,
              width: 56,
              height: 56,
            ),
          ),
          sizedBoxH12,
          Text(data.name),
        ],
      ),
    );
  }
}
