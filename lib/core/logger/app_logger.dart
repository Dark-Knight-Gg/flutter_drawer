import 'dart:developer' as developer;

import '../configs/constants.dart';

class AppLogger {
  static log(String message, {String tag = Constants.appLogKey}) {
    developer.log(message, name: tag);
  }
}
