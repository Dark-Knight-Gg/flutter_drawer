import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback callback;

  const AppButton(this.text, this.enabled, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    final onPressed = enabled ? callback : null;
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0xFF2F80ED),
      height: 48,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
      ),
      textColor: Colors.white,
      disabledColor: Colors.grey.shade400,
      highlightElevation: 0,
      highlightColor: const Color(0xFF2B63B9),
      textTheme: ButtonTextTheme.normal,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const AppTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF2F80ED),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
