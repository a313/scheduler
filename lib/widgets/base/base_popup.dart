import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../base/base_button.dart';

class BasePopup extends StatelessWidget {
  const BasePopup({
    super.key,
    this.title,
    this.desc,
    this.header,
    this.titleWidget,
    this.descWidget,
    required this.actions,
    this.headerPadding = const EdgeInsets.only(top: 20),
  });

  final EdgeInsets headerPadding;
  final Widget? header;

  final String? title;
  final String? desc;
  final Widget? titleWidget;
  final Widget? descWidget;
  final List<BaseButton> actions;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final maxWidth = min(320.0, mq.size.width * 0.96);
    const padHoz = 24.0;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            decoration: BoxDecoration(
                borderRadius: borRad08, color: context.neutral100),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (header != null)
                    Padding(
                      padding: headerPadding,
                      child: header!,
                    ),
                  if (title != null || titleWidget != null)
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(padHoz, 16.0, padHoz, 0),
                      child: Material(
                        child: titleWidget ??
                            Text(
                              title!,
                              style: AppFonts.h500
                                  .copyWith(color: context.neutral1100),
                              textAlign: TextAlign.center,
                            ),
                      ),
                    ),
                  if (desc != null || descWidget != null)
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(padHoz, 16.0, padHoz, 0),
                      child: Material(
                        child: descWidget ??
                            Text(
                              desc!,
                              style: AppFonts.pMedium
                                  .copyWith(color: context.neutral1100),
                              textAlign: TextAlign.center,
                            ),
                      ),
                    ),
                  if (actions.length == 1)
                    _SingleButton(padHoz: padHoz, actions: actions)
                  else
                    _MultiButton(
                        maxWidth: constraints.maxWidth, actions: actions)
                ],
              ),
            ),
          ),
        ));
  }
}

class _SingleButton extends StatelessWidget {
  const _SingleButton({
    required this.padHoz,
    required this.actions,
  });

  final double padHoz;
  final List<BaseButton> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padHoz, 24.0, padHoz, 16.0),
      child: SizedBox(width: double.infinity, child: actions[0]),
    );
  }
}

class _MultiButton extends StatelessWidget {
  const _MultiButton({
    required this.actions,
    required this.maxWidth,
  });

  final double maxWidth;
  final List<BaseButton> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(actions.length * 2 - 1, (index) {
          if (index.isEven) {
            final action = actions[index ~/ 2];
            final width =
                min(130.0, maxWidth / actions.length + 6 * actions.length);
            return Flexible(
              // fit: FlexFit.loose,
              child: SizedBox(
                width: width,
                child: action,
              ),
            );
          } else {
            return sizedBoxW08;
          }
        }),
      ),
    );
  }
}
