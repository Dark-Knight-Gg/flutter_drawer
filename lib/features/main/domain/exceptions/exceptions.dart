class ApiException {
  final String? code;
  final String? messageCode;
  final String? message;
  final dynamic data;
  final dynamic extra;

  ApiException({
    this.code,
    this.messageCode,
    this.message,
    this.data,
    this.extra,
  });
}

enum ApiExceptionType {
  other('');

  final String? code;

  const ApiExceptionType(this.code);

  static ApiExceptionType fromCode(String code) {
    for (var element in ApiExceptionType.values) {
      if (element.code == code) {
        return element;
      }
    }
    return ApiExceptionType.other;
  }
}
