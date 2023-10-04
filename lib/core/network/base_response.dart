class BaseResponse {
  final int? statusCode;
  final String? message;
  final dynamic data;

  BaseResponse({this.statusCode, this.message, this.data});

  BaseResponse.error({this.message})
      : data = null,
        statusCode = null;

  BaseResponse.ignored()
      : message = "Yêu cầu đã được xử lý",
        data = null,
        statusCode = null;

  bool get isSuccess => statusCode == 200;
  bool get shouldIgnore => statusCode == -1;
}
