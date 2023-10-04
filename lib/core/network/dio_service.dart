import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:scheduler/core/network/base_response.dart';

abstract class DioService {
  String get domain;
  late Dio dio;

  DioService() {
    dio = Dio(BaseOptions(
      baseUrl: domain,
      connectTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 30),
    ));
  }

  Future<BaseResponse> get({
    required String endPoint,
    Map<String, dynamic>? params,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
    final start = DateTime.now();
    try {
      final response = await dio.get(
        endPoint,
        options: options,
        queryParameters: params,
        onReceiveProgress: onReceiveProgress,
      );
      response.logToConsole(startRq: start, params: params);
      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    } on DioException catch (e) {
      return BaseResponse.error(message: e.message);
    } catch (e) {
      return BaseResponse.error(message: e.toString());
    }
  }

  Future<BaseResponse> post({
    required String endPoint,
    Map<String, dynamic>? params,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final start = DateTime.now();
    try {
      final response = await dio.post(
        endPoint,
        data: params,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      response.logToConsole(startRq: start, params: params);
      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    } on DioException catch (e) {
      return BaseResponse.error(message: e.message);
    } catch (e) {
      return BaseResponse.error(message: e.toString());
    }
  }

  Future<BaseResponse> put({
    required String endPoint,
    Map<String, dynamic>? params,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final start = DateTime.now();
    try {
      final response = await dio.put(
        endPoint,
        data: params,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      response.logToConsole(startRq: start, params: params);
      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    } on DioException catch (e) {
      return BaseResponse.error(message: e.message);
    } catch (e) {
      return BaseResponse.error(message: e.toString());
    }
  }

  Future<BaseResponse> delete({
    required String endPoint,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    final start = DateTime.now();
    try {
      final response = await dio.delete(
        endPoint,
        data: params,
        options: options,
      );
      response.logToConsole(startRq: start, params: params);
      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    } on DioException catch (e) {
      return BaseResponse.error(message: e.message);
    } catch (e) {
      return BaseResponse.error(message: e.toString());
    }
  }

  Future<BaseResponse> download({
    required String endPoint,
    required String savePath,
    Map<String, dynamic>? params,
    ProgressCallback? onReceiveProgress,
  }) async {
    final start = DateTime.now();
    try {
      final response = await dio.download(
        endPoint,
        savePath,
        queryParameters: params,
        onReceiveProgress: onReceiveProgress,
      );
      response.logToConsole(startRq: start, params: params);
      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    } on DioException catch (e) {
      return BaseResponse.error(message: e.message);
    } catch (e) {
      return BaseResponse.error(message: e.toString());
    }
  }
}

extension BaseResponseExtension on Response {
  void logToConsole({String name = 'API', DateTime? startRq, dynamic params}) {
    // ignore: unused_local_variable
    final endRq = DateTime.now();
    final method = requestOptions.method;
    final fullUrl = realUri.toString();
    final header = requestOptions.headers;

    // var apidata = ApiData(
    //   statusCode: statusCode,
    //   method: method,
    //   url: fullUrl,
    //   header: header,
    //   params: params,
    //   response: data,
    //   requestDate: endRq,
    //   responseTime: endRq.difference(startRq ?? endRq).inMilliseconds,
    //   extraData: headers,
    // );
    // if (statusCode == 200) {
    //   DebugHelper.addApiSuccess(apidata);
    // } else {
    //   DebugHelper.addApiFailed(apidata);
    // }

    if (!kDebugMode) return;
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    try {
      log("Header => ${encoder.convert(header)}", name: name);
      log("Method.$method Url:$fullUrl Params: $params", name: name);
      log("BaseResponse => ${encoder.convert(data)}", name: name);
    } catch (e) {
      log(e.toString(), name: "API");
    }
  }

  bool get isServerError {
    return statusCode != null && statusCode! >= 500 && statusCode! < 600;
  }
}
