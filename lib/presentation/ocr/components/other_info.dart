import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

import 'bottom_option_camera.dart';
import 'frame_face.dart';
import 'header_option_camera.dart';

class OtherInfo extends StatelessWidget {
  final Key? frameKey;

  const OtherInfo({
    Key? key,
    this.frameKey,
    required this.enableBtn,
    required this.type,
    this.onPickImage,
    this.onTakePicture,
    required this.recentPhoto,
    this.onSwapCamera,
  }) : super(key: key);
  final bool enableBtn;
  final CameraType type;
  final Function()? onPickImage;
  final Function()? onTakePicture;
  final Function()? onSwapCamera;
  final Uint8List recentPhoto;

  @override
  Widget build(BuildContext context) {
    var topText = "";
    var midText = "";
    var botText = "";

    Widget cameraFrame = const SizedBox();
    switch (type) {
      case CameraType.fontCmnd:
        topText = "Mặt trước\nGiấy tờ tùy thân";
        midText = "MẶT TRƯỚC";
        botText = "Vui lòng đặt giấy tờ nằm trong\n khung hình chữ nhật";
        cameraFrame = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
          child: Center(
            child: Image.asset("assets/png/ekyc/ic_take_photo_frame.png",
                key: frameKey, width: 337, height: 213, fit: BoxFit.fill),
          ),
        );

        break;
      case CameraType.backCmnd:
        topText = "Mặt sau\nGiấy tờ tùy thân";
        midText = "MẶT SAU";
        botText = "Vui lòng đặt giấy tờ nằm trong\n khung hình chữ nhật";
        cameraFrame = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
          child: Image.asset("assets/png/ekyc/ic_take_photo_frame.png",
              key: frameKey, fit: BoxFit.cover),
        );

        break;
      case CameraType.passport:
        topText = "Trang 2\nHộ chiếu Việt Nam";
        midText = "TRANG 2";
        botText = "Vui lòng đặt giấy tờ nằm trong\n khung hình chữ nhật";
        cameraFrame = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
          child: Image.asset("assets/png/ekyc/ic_take_photo_frame.png",
              key: frameKey, fit: BoxFit.cover),
        );

        break;
      case CameraType.portrait:
        topText = "Chụp khuôn mặt\ncủa bạn";
        midText = "";
        botText = "Đặt khuôn mặt của bạn vào đúng khung hình";
        cameraFrame = FrameFace(frameKey: frameKey);
        break;
      case CameraType.freeStyle:
        topText = "";
        midText = "";
        botText = "";
        cameraFrame = FrameFace(frameKey: frameKey);
    }
    final appBarHeight = AppBar().preferredSize.height;

    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: HeaderOptionCamera(
              appBarHeight: appBarHeight,
              topText: topText,
              bgColor: Colors.black12,
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                cameraFrame,
                Positioned(
                  bottom: 10,
                  child: Text(
                    midText,
                    style: AppFonts.bMedium.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: BottomOptionCamera(
              bgColor: Colors.black12,
              botText: botText,
              enableBtn: enableBtn,
              onPickImage: onPickImage,
              onTakePicture: onTakePicture,
              onSwapCamera: onSwapCamera,
              recentPhoto: recentPhoto,
            ),
          ),
        ],
      ),
    );
  }
}
