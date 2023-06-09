// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../custom_divider.dart';

const BOTTOMSHEET_TITLE_HEIGHT = 64.0;

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    Key? key,
    // required this.height,
    required this.child,
    required this.title,
    this.iconX = true,
    this.subTitle,
    this.bottomButton = false,
  }) : super(key: key);
  // final double height;
  final Widget child;
  final String title;
  final Widget? subTitle;
  final bool iconX;
  final bool bottomButton;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
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
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                        child: AutoSizeText(
                          title,
                          maxLines: 1,
                          minFontSize: 6,
                          style: AppFonts.h400
                              .copyWith(color: context.neutral1100),
                        ),
                      ),
                    ),
                    if (iconX)
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: context.primaryDark,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                  ],
                ),
                subTitle == null
                    ? const SizedBox()
                    : Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 16.0),
                        child: subTitle,
                      ),
                const CustomDivider(),
                ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: context.screenHeight * 0.8),
                    child: child),
                SizedBox(
                  height: 8.0 +
                      (Platform.isAndroid ? context.viewPadding.bottom : 0.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
