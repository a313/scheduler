import 'package:flutter/material.dart';

const eventPage = 'EVENT_PAGE';
const reminderPage = 'REMINDER_PAGE';
const reportPage = 'REPORT_PAGE';
const classPage = 'CLASS_PAGE';
const studentPage = 'STUDENT_PAGE';
const hexPage = 'HEX_PAGE';
const timeTablePage = 'TIME_PAGE';
const settingPage = 'SETTING_PAGE';
const qrPage = 'QR_PAGE';
const weatherPage = 'WEATHER_PAGE';
const periodsPage = 'PERIODS_PAGE';
const clockPage = 'CLOCK_PAGE';
const ocrPage = 'OCR_PAGE';
const vpnPage = 'VPN_PAGE';
const musicPlayerPage = 'MUSIC_PLAYER_PAGE';
const musicDownloaderPage = 'MUSIC_DOWNLOADER_PAGE';
const lunarPage = 'LUNAR_PAGE';

class Feature {
  final String key;
  final Widget page;
  final Widget icon;
  final Widget activeIcon;
  final String label;

  Feature({
    required this.page,
    required this.key,
  required  this.icon,
   required this.activeIcon,
   required this.label,
  });
}
