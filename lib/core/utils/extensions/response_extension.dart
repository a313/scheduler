// import 'dart:convert';
// import 'dart:developer';

// import 'package:debug_helper/debug_helper.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:gimo/flavor/flavor_config.dart';

// extension ResponseExtension on Response {
//   void logToConsole({String name = 'API', DateTime? startRq, dynamic params}) {
//     if (FlavorConfig.isProduction()) return;

//     final endRq = DateTime.now();
//     final method = requestOptions.method;
//     final fullUrl = realUri.toString();
//     final header = requestOptions.headers;
//     var apidata = ApiData(
//         method: method,
//         url: fullUrl,
//         header: header,
//         params: params,
//         response: data,
//         requestDate: endRq,
//         responseTime: endRq.difference(startRq ?? endRq).inMilliseconds);
//     if (statusCode == 200) {
//       DebugHelper.addApiSuccess(apidata);
//     } else {
//       DebugHelper.addApiFailed(apidata);
//     }

//     if (!kDebugMode) return;
//     const JsonEncoder encoder = JsonEncoder.withIndent('  ');
//     try {
//       // log("Header => ${encoder.convert(header)}", name: name);
//       log("Method.$method Url:$fullUrl Params: $params", name: name);
//       log("Response => ${encoder.convert(data)}", name: name);
//     } catch (e) {
//       log(toString(), name: "API");
//     }
//   }
// }
