import 'dart:convert';

import 'event_tracking.dart';

class ApiException extends EventTracking {
  final String status;
  final String endPoint;
  final String method;
  final String? exception;
  final String? bodyString;
  final dynamic param;

  ApiException({
    required this.endPoint,
    required this.method,
    required this.status,
    this.exception,
    this.bodyString,
    this.param,
  }) : super(name: "API") {
    other = {
      "status": status,
      "endPoint": endPoint,
      "method": method,
      "exception": exception ?? "",
      // "bodyString": bodyString ?? "null",
      "param": jsonEncode(param),
    };
  }
}
