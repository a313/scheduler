// ignore_for_file: constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../custom_divider.dart';

const BOTTOMSHEET_TITLE_HEIGHT = 64.0;

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.subTitle,
    this.bottom = true,
  });

  final Widget child;
  final String? title;
  final Widget? subTitle;

  /// Whether to avoid system intrusions on the bottom side of the screen.
  final bool bottom;

  @override
  Widget build(BuildContext context) {
    final hasHeader = title != null || subTitle != null;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0)),
                color: context.neutral100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasHeader)
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                          child: AutoSizeText(
                            title ?? '',
                            maxLines: 1,
                            minFontSize: 6,
                            style: AppFonts.h400
                                .copyWith(color: context.neutral1100),
                          ),
                        ),
                      ),
                      subTitle ?? const SizedBox(),
                    ],
                  ),
                if (hasHeader) const CustomDivider(),
                ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: context.screenHeight * 0.8),
                    child: SafeArea(
                      bottom: bottom,
                      child: child,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
