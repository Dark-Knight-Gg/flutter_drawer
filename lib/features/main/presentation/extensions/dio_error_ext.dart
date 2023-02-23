import 'package:dio/dio.dart';

import '../../domain/exceptions/exceptions.dart';

extension DioErrorExt on DioError {
  ApiException toApiException() {
    final responseMap = response?.data as Map<dynamic, dynamic>;
    return ApiException(
      code: responseMap['status'],
      messageCode: responseMap['messageCode'],
      message: responseMap['message'],
      data: responseMap['result'],
    );
  }
}
