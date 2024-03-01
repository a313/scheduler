import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class BaseButton extends StatelessWidget {
  final WidgetBuilder builder;

  const BaseButton._({required this.builder});

  factory BaseButton.fixBottom({
    required String title,
    required VoidCallback? onPressed,
  }) {
    return BaseButton._(
        builder: (context) => BottomBackground(
              child: SizedBox(
                height: 48.0,
                width: double.infinity,
                child: PrimaryButton(
                  title: title,
                  onPressed: onPressed,
                  padding: padSymHor24Ver12,
                  textStyle: AppFonts.h400
                      .copyWith(color: context.neutral100, height: 1),
                ),
              ),
            ));
  }

  factory BaseButton.fixBottomSecondary({
    required String title,
    required VoidCallback? onPressed,
  }) {
    return BaseButton._(
        builder: (context) => BottomBackground(
              child: SizedBox(
                height: 48.0,
                width: double.infinity,
                child: SecondaryButton(
                  title: title,
                  onPressed: onPressed,
                  padding: padSymHor24Ver12,
                  textStyle: AppFonts.h400
                      .copyWith(color: context.primaryDark, height: 1),
                ),
              ),
            ));
  }

  factory BaseButton.fixBottom2({
    required String leftTitle,
    required VoidCallback? onLeftPressed,
    required String rightTitle,
    required VoidCallback? onRightPressed,
  }) {
    return BaseButton._(
        builder: (context) => BottomBackground(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2.0, color: context.primaryDark),
                              borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor: context.neutral100,
                          padding: padSymHor24Ver12,
                          elevation: 0,
                        ),
                        onPressed: onLeftPressed,
                        child: Text(leftTitle,
                            textScaler: const TextScaler.linear(1),
                            maxLines: 1,
                            style: AppFonts.h400.copyWith(
                                color: context.primaryDark, height: 1)),
                      ),
                    ),
                  ),
                  sizedBoxW16,
                  Expanded(
                    child: SizedBox(
                      height: 48.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor: context.primaryDark,
                          padding: padSymHor24Ver12,
                          elevation: 0,
                        ),
                        onPressed: onRightPressed,
                        child: Text(rightTitle,
                            textScaler: const TextScaler.linear(1),
                            maxLines: 1,
                            style: AppFonts.h400.copyWith(
                                color: context.neutral100, height: 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  factory BaseButton.largePrimary({
    required String title,
    required VoidCallback? onPressed,
    double? width = double.infinity,
  }) {
    return BaseButton._(
        builder: (context) => SizedBox(
              height: 48.0,
              width: width,
              child: PrimaryButton(
                  title: title,
                  onPressed: onPressed,
                  padding: padSymHor24Ver12,
                  textStyle: AppFonts.h400
                      .copyWith(color: context.neutral100, height: 1)),
            ));
  }

  factory BaseButton.mediumPrimary({
    required String title,
    required VoidCallback? onPressed,
    double? width,
  }) {
    return BaseButton._(
        builder: (context) => SizedBox(
              height: 38.0,
              width: width,
              child: PrimaryButton(
                  title: title,
                  onPressed: onPressed,
                  padding: padSymHor16Ver08,
                  textStyle: AppFonts.h300
                      .copyWith(color: context.neutral100, height: 1)),
            ));
  }

  factory BaseButton.largeSecondary({
    required String title,
    required VoidCallback? onPressed,
    double? width,
  }) {
    return BaseButton._(
      builder: (context) => SizedBox(
        height: 48.0,
        width: width,
        child: SecondaryButton(
          title: title,
          onPressed: onPressed,
          padding: padSymHor24Ver12,
          textStyle:
              AppFonts.h400.copyWith(color: context.primaryDark, height: 1),
        ),
      ),
    );
  }

  factory BaseButton.mediumSecondary({
    required String title,
    required VoidCallback? onPressed,
    double? width,
  }) {
    return BaseButton._(
      builder: (context) => SizedBox(
        height: 38.0,
        width: width,
        child: SecondaryButton(
          title: title,
          onPressed: onPressed,
          padding: padSymHor16Ver08,
          textStyle:
              AppFonts.h300.copyWith(color: context.primaryDark, height: 1),
        ),
      ),
    );
  }

  factory BaseButton.background({
    required String title,
    required String bgPath,
    required VoidCallback? onPressed,
    double? width,
  }) {
    return BaseButton._(
        builder: (context) => GestureDetector(
              onTap: onPressed,
              behavior: HitTestBehavior.translucent,
              child: Container(
                height: 48.0,
                width: width,
                padding: padSymHor24Ver12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(bgPath),
                      fit: BoxFit.fill,
                    )),
                child: Text(title,
                    style: AppFonts.h400.copyWith(
                      color: context.neutral100,
                      height: 1,
                    )),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: builder);
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.padding,
    required this.textStyle,
  });
  final String title;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: context.primaryDark,
        padding: padding,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(title,
          textScaler: const TextScaler.linear(1),
          maxLines: 1,
          style: textStyle),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.padding,
    required this.textStyle,
  });
  final String title;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.0, color: context.primaryDark),
            borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: context.neutral100,
        padding: padding,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(title,
          textScaler: const TextScaler.linear(1),
          maxLines: 1,
          style: textStyle),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.content,
    this.onPressed,
    this.padding = padAll08,
    this.backgroundColor,
  });
  final WidgetBuilder content;
  final Color? backgroundColor;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: backgroundColor ?? context.primaryDark,
        padding: padding,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: content(context),
    );
  }
}

class BottomBackground extends StatelessWidget {
  final Widget child;

  const BottomBackground({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16.0,
        12.0,
        16.0,
        max(12.0, context.viewPadding.bottom + 2.0),
      ),
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(
            width: 1.0,
            color: Color.fromARGB(100, 120, 121, 121),
          ),
        ),
        color: context.neutral100,
      ),
      child: child,
    );
  }
}
