import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfo {
  factory DeviceInfo() => _instance ??= DeviceInfo._();

  String? deviceAgent;

  String? deviceUUID;
  String appVersion = "";
  String buildNumber = "";
  String? osVersion;
  String timeZone = "";
  String deviceOsName = "other";

  String sessionID = "";
  int? androidSdkLevel;
  String? androidVersion;
  DeviceInfo._();

  static DeviceInfo? _instance;

  Future<void> getDeviceInfo() async {
    try {
      await Future.wait([
        _getDeviceInfo(),
        _getAppVersion(),
      ]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      deviceOsName = "android";
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceAgent = androidInfo.model;
      osVersion =
          "Android ${androidInfo.version.release} SDK${androidInfo.version.sdkInt}";
      androidVersion = androidInfo.version.release;
      deviceUUID = androidInfo.id;
      androidSdkLevel = androidInfo.version.sdkInt;
    } else if (Platform.isIOS) {
      deviceOsName = "ios";
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceAgent = iosInfo.utsname.machine;
      osVersion = iosInfo.systemVersion;
      deviceUUID = iosInfo.identifierForVendor;
    }
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }

  static int compareVersion(String v1, String v2) {
    final v1Split = v1.split('.');
    final v2Split = v2.split('.');
    final length =
        v1Split.length > v2Split.length ? v1Split.length : v2Split.length;

    for (int i = 0; i < length; i++) {
      int x1 = 0, x2 = 0;
      if (v1Split.length > i) {
        x1 = int.tryParse(v1Split.elementAt(i).numericOnly()) ?? 0;
      }
      if (v2Split.length > i) {
        x2 = int.tryParse(v2Split.elementAt(i).numericOnly()) ?? 0;
      }
      if (i == length - 1 && x1 == x2) return 0;
      if (x1 > x2) return 1;
      if (x2 > x1) return -1;
    }
    return 0;
  }
}
