import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class OnboardPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subTitle;

  const OnboardPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  @override
  State<StatefulWidget> createState() {
    return OnboardPageState();
  }
}

class OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: Image(
            image: AssetImage(
              widget.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          minimum: padAll16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: AppFonts.bMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                widget.subTitle,
                style: AppFonts.bSmall,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
              sizedBoxH90,
            ],
          ),
        ),
      ],
    );
  }
}
