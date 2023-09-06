import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class TransformImage {
  static Uint8List cropCMND(img.Image image, CropInfo cropInfo) {
    var scale = image.width / cropInfo.cameraSize.width;
    bool isLandscape = false;
    if (image.width > image.height) {
      scale = image.height / cropInfo.cameraSize.width;
      isLandscape = true;
    }

    final h = (cropInfo.frameSize.height) * scale + 2;
    final w = (cropInfo.frameSize.width) * scale + 2;
    final y = (cropInfo.frameOffset.dy - cropInfo.cameraOffset.dy) * scale - 1;
    final x = cropInfo.frameOffset.dx * scale - 1;

    if (isLandscape) {
      final img.Image cropped = img.copyCrop(image,
          x: y.toInt(), y: x.toInt(), width: h.toInt(), height: w.toInt());
      final bytes = img.encodeJpg(cropped);

      return Uint8List.fromList(bytes);
    } else {
      final img.Image cropped = img.copyCrop(image,
          x: x.toInt(), y: y.toInt(), width: w.toInt(), height: h.toInt());
      final bytes = img.encodeJpg(cropped);

      return Uint8List.fromList(bytes);
    }
  }

  static Uint8List cropPortrait(img.Image image, CropInfo cropInfo) {
    var scale = image.width / cropInfo.cameraSize.width;
    bool isLandscape = false;
    if (image.width > image.height) {
      scale = image.height / cropInfo.cameraSize.width;
      isLandscape = true;
    }
    final y = (cropInfo.frameOffset.dy - cropInfo.cameraOffset.dy) * scale - 2;
    // final padWidth = 53.0 / 375.0 * cropInfo.frameSize.width;
    final padWidth = (cropInfo.frameSize.width - cropInfo.frameSize.height) / 2;
    final x = (cropInfo.frameOffset.dx + padWidth) * scale;
    final h = (cropInfo.frameSize.height) * scale - 4;
    final w = (cropInfo.frameSize.width) * scale - 2 * x;

    if (isLandscape) {
      final img.Image cropped = img.copyCrop(image,
          x: y.toInt(), y: x.toInt(), width: h.toInt(), height: w.toInt());
      final bytes = img.encodeJpg(cropped);

      return Uint8List.fromList(bytes);
    } else {
      final img.Image cropped = img.copyCrop(image,
          x: x.toInt(), y: y.toInt(), width: w.toInt(), height: h.toInt());
      final bytes = img.encodeJpg(cropped);

      return Uint8List.fromList(bytes);
    }
  }

  static Uint8List cropScreenShot(img.Image image, CropInfo cropInfo) {
    var scale = image.width / cropInfo.cameraSize.width;
    bool isLandscape = false;
    if (image.width > image.height) {
      scale = image.height / cropInfo.cameraSize.width;
      isLandscape = true;
    }
    final h = cropInfo.frameSize.height * scale;
    final w = cropInfo.frameSize.width * scale;
    final y = cropInfo.frameOffset.dy * scale;
    final x = cropInfo.frameOffset.dx * scale;

    if (isLandscape) {
      final img.Image cropped = img.copyCrop(image,
          x: y.toInt(), y: x.toInt(), width: h.toInt(), height: w.toInt());
      final bytes = img.encodeJpg(cropped);

      return Uint8List.fromList(bytes);
    } else {
      final img.Image cropped = img.copyCrop(image,
          x: x.toInt(), y: y.toInt(), width: w.toInt(), height: h.toInt());
      final bytes = img.encodeJpg(cropped);

      return Uint8List.fromList(bytes);
    }
  }

  static Uint8List cropQr(img.Image image) {
    final size = (0.4 * image.height).ceil();
    final w = image.width;
    final img.Image cropped =
        img.copyCrop(image, x: w - size, y: 0, width: size, height: size);
    final bytes = img.encodeJpg(cropped);
    return Uint8List.fromList(bytes);
  }

  static CropInfo getCropInfo(GlobalKey cameraKey, GlobalKey frameKey) {
    final cameraObj =
        cameraKey.currentContext!.findRenderObject()! as RenderBox;
    final frameObj = frameKey.currentContext!.findRenderObject()! as RenderBox;
    final cameraSize = cameraObj.size;
    final frameSize = frameObj.size;
    final frameOffset = frameObj.localToGlobal(Offset.zero);
    final cameraOffset = cameraObj.localToGlobal(Offset.zero);
    return CropInfo(
        cameraSize: cameraSize,
        frameSize: frameSize,
        cameraOffset: cameraOffset,
        frameOffset: frameOffset);
  }
}

class CropInfo {
  Size cameraSize;
  Size frameSize;
  Offset cameraOffset;
  Offset frameOffset;

  CropInfo({
    required this.cameraSize,
    required this.frameSize,
    required this.cameraOffset,
    required this.frameOffset,
  });
}
