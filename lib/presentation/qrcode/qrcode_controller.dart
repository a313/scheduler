import 'dart:typed_data';

import 'package:flutter/widgets.dart' hide Image;
import 'package:get/get.dart';
import 'package:image/image.dart';
import 'package:qr_image/qr_image.dart';
import 'package:share_plus/share_plus.dart';

class QrcodeController extends GetxController with StateMixin<Uint8List> {
  TextEditingController contentController = TextEditingController();
  String? logoPath;
  Uint8List? qrByte;
  final formKey = GlobalKey<FormState>();

  Future<void> generateQr() async {
    if (formKey.currentState?.validate() ?? false) {
      Image? logo;
      final path = logoPath;
      if (path != null) {
        if (path.endsWith('png')) {
          logo = await decodePngFile(path);
        } else {
          logo = await decodeJpgFile(path);
        }
      }

      final qr = QRImage(
        contentController.text,
        size: 300,
        logo: logo,
        errorCorrectLevel: logo == null ? 1 : 2,
      ).generate();
      qrByte = encodePng(qr);
      change(qrByte, status: RxStatus.success());
    }
  }

  void onChangedLogo(String path) {
    logoPath = path;
  }

  void shareQr() {
    if (qrByte != null) {
      Share.shareXFiles(
        [XFile.fromData(qrByte!)],
        text: contentController.text,
      );
    }
  }
}
