import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/timetable.dart';

class ListTimetableConverter implements JsonConverter<List<Timetable>, String> {
  const ListTimetableConverter();

  @override
  List<Timetable> fromJson(String json) {
    if (json.isEmpty) return [];
    return json
        .split(PATTERN)
        .map((e) => Timetable.fromJson(jsonDecode(e)))
        .toList();
  }

  @override
  String toJson(List<Timetable> object) {
    final result = object.map((e) => jsonEncode(e.toJson())).join(PATTERN);
    return result;
  }
}

class TimeOfDayConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(String json) {
    final split = json.split(":");
    return TimeOfDay(hour: int.parse(split[0]), minute: int.parse(split[1]));
  }

  @override
  String toJson(TimeOfDay object) {
    return '${object.hour}:${object.minute}';
  }
}

class ListIntConverter implements JsonConverter<List<int>, String> {
  const ListIntConverter();
  @override
  List<int> fromJson(String json) {
    return json.toListInt(PATTERN);
  }

  @override
  String toJson(List<int> object) {
    return object.join(PATTERN);
  }
}

class ListStringConverter implements JsonConverter<List<String>, String> {
  const ListStringConverter();
  @override
  List<String> fromJson(String json) {
    return json.split(PATTERN);
  }

  @override
  String toJson(List<String> object) {
    return object.join(PATTERN);
  }
}

class BoolConverter implements JsonConverter<bool, int> {
  const BoolConverter();
  @override
  bool fromJson(int json) {
    return json == 1;
  }

  @override
  int toJson(bool object) {
    return object ? 1 : 0;
  }
}

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json, isUtc: true).toLocal();
  }

  @override
  int toJson(DateTime object) {
    if (object.isUtc) {
      return object.millisecondsSinceEpoch;
    } else {
      return object.toUtc().millisecondsSinceEpoch;
    }
  }
}
