class BaseResponse<R> {
  final String status;
  final String messageCode;
  final String message;
  final R result;

  BaseResponse(this.status, this.messageCode, this.message, this.result);
}
