enum ToastType { normal, success, error, warning }

class ToastEvent {
  final String message;
  final ToastType type;

  ToastEvent._(this.message, this.type);

  ToastEvent.normal(String message) : this._(message, ToastType.normal);

  ToastEvent.success(String message) : this._(message, ToastType.success);

  ToastEvent.error(String message) : this._(message, ToastType.error);

  ToastEvent.warning(String message) : this._(message, ToastType.warning);

  @override
  String toString() {
    return 'ToastEvent{message: $message, type: $type}';
  }
}
