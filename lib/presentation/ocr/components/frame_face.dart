import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';

class FrameFace extends StatelessWidget {
  const FrameFace({
    super.key,
    required this.frameKey,
  });

  final Key? frameKey;

  @override
  Widget build(BuildContext context) {
    final heightFrame = Get.height * 4 / 8;
    final heightElliptical = heightFrame - 20;
    final widthElliptical = heightFrame * 3 / 4;
    return Stack(
      fit: StackFit.expand,
      key: frameKey,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.srcOut,
          ), // This one will create the magic
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  backgroundBlendMode: BlendMode.dstOut,
                ), // This one will handle background + difference out
              ),
              Align(
                child: Container(
                  height: heightElliptical,
                  width: widthElliptical,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                        Radius.elliptical(widthElliptical, heightElliptical)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            height: heightElliptical,
            width: widthElliptical,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                  Radius.elliptical(widthElliptical, heightElliptical)),
              border: Border.all(
                color: context.primaryDark,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
