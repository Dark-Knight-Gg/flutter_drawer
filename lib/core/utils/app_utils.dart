import 'package:flutter/material.dart';

class AppUtils {
  const AppUtils._();

  static Color colorFromHex(String hexColor) {
    try {
      final hexCode = hexColor.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    } on Exception catch (_) {
      return Colors.transparent;
    }
  }

  static void hideKeyboard() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  static void showKeyboard(BuildContext context, FocusNode inputNode) {
    FocusScope.of(context).requestFocus(inputNode);
  }
}
