import 'package:flutter/material.dart';

import '../configs/constants_widget.dart';
import 'toast_event.dart';

class ToastWidget extends StatelessWidget {
  final ToastEvent event;

  const ToastWidget({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData(),
            color: Colors.white,
          ),
          width12,
          Expanded(
            child: Text(
              event.message,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: textColor(),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData iconData() {
    switch (event.type) {
      case ToastType.normal:
        return Icons.notifications_rounded;
      case ToastType.success:
        return Icons.done;
      case ToastType.error:
        return Icons.error_outline_rounded;
      case ToastType.warning:
        return Icons.warning_amber_rounded;
    }
  }

  Color backgroundColor() {
    switch (event.type) {
      case ToastType.normal:
        return Colors.blueGrey;
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
      case ToastType.warning:
        return Colors.amber;
    }
  }

  Color textColor() {
    return Colors.white;
  }
}
