import 'package:flutter/material.dart';

import 'progress_event.dart';
import 'progress_widget.dart';

class ProgressHelper {
  static Future? _progressDialog;

  static handleProgressDialog(BuildContext context, ProgressEvent event) {
    switch (event.type) {
      case ProgressType.show:
        showProgressDialog(context, event.dismissible);
        break;
      case ProgressType.hide:
        hideProgressDialog(context);
        break;
    }
  }

  static void showProgressDialog(BuildContext context, bool dismissible) async {
    if (_progressDialog == null) {
      _progressDialog = showDialog(
          context: context,
          barrierDismissible: dismissible,
          builder: (_) => ProgressWidget(dismissible: dismissible),
          useRootNavigator: false);
      await _progressDialog;
      _progressDialog = null;
    }
  }

  static void hideProgressDialog(BuildContext context) async {
    if (_progressDialog != null) {
      Navigator.of(context).pop();
    }
  }
}
