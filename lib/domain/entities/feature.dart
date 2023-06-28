import 'package:flutter/material.dart';

const eventPage = 'EVENT_PAGE';
const reminderPage = 'REMINDER_PAGE';
const reportPage = 'REPORT_PAGE';
const classPage = 'CLASS_PAGE';
const studentPage = 'STUDENT_PAGE';
const hexPage = 'HEX_PAGE';
const timeTablePage = 'TIME_PAGE';

class Feature {
  final String key;
  final Widget page;
  final BottomNavigationBarItem item;

  Feature({required this.page, required this.item, required this.key});
}
