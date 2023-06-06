import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:url_launcher/url_launcher.dart';

class HexToLinkController extends BaseController {
  late TextEditingController hexController, decodedController;

  @override
  void onInit() {
    hexController = TextEditingController();
    decodedController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    getString();
    super.onReady();
  }

  Future<void> getString() async {
    if (await Clipboard.hasStrings()) {
      final data = await Clipboard.getData(Clipboard.kTextPlain);
      if (data != null && data.text.hasText) {
        final str = data.text!;
        hexController.text = str;
        try {
          final decoded = Utils.hexToAscii(str);
          decodedController.text = decoded;
        } catch (e) {
          showSnackBar('Invalid hex encoded string.', type: SnackBarType.error);
        }
      }
    }
  }

  //TODO
  void onDecode() {
    try {
      final str = hexController.text;
      final decoded = Utils.hexToAscii(str);
      decodedController.text = decoded;
    } catch (e) {
      showSnackBar('Invalid hex encoded string.', type: SnackBarType.error);
    }
  }

  Future<void> onOpen() async {
    late String url;
    late Uri uri;
    try {
      final str = hexController.text;
      url = Utils.hexToAscii(str);
      decodedController.text = url;
    } catch (e) {
      showSnackBar('Invalid hex encoded string.', type: SnackBarType.error);
      return;
    }

    try {
      uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        launchUrl(uri);
      } else {
        showSnackBar('Cannot lauch url.', type: SnackBarType.error);
      }
    } catch (e) {
      showSnackBar('Invalid url.', type: SnackBarType.error);
    }
  }
}
