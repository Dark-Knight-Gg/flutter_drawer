import 'package:fluttertoast/fluttertoast.dart';

import 'toast_event.dart';
import 'toast_widget.dart';

class ToastHelper {
  static void showToast(FToast toast, ToastEvent event) {
    toast.showToast(child: ToastWidget(event: event));
  }

  static void showToastSuccess(FToast toast, String? message) {
    if (message == null) return;
    showToast(toast, ToastEvent.success(message));
  }

  static void showToastError(FToast toast, String? message) {
    if (message == null) return;
    showToast(toast, ToastEvent.error(message));
  }

  static void showToastWarning(FToast toast, String? message) {
    if (message == null) return;
    showToast(toast, ToastEvent.warning(message));
  }
}
