import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scheduler/core/utils/util.dart';

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
