import 'package:flutter_bloc/flutter_bloc.dart';

import '../configs/constants.dart';
import '../logger/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  static AppBlocObserver? _instance;

  static AppBlocObserver get instance => _instance ??= AppBlocObserver._();

  AppBlocObserver._();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _log("${bloc.runtimeType}: onCreate");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _log("${bloc.runtimeType}: onEvent, $event");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _log("${bloc.runtimeType}: onChange, $change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _log("${bloc.runtimeType}: onTransition, $transition");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _log("${bloc.runtimeType}: onError, $error");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _log("${bloc.runtimeType}: onClose");
  }

  void _log(String message) {
    AppLogger.log(message, tag: _tagLog());
  }

  String _tagLog() => "${Constants.appLogKey}-${Constants.blocLogSuffix}";
}
