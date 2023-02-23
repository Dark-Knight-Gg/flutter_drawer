import 'dart:async';

import 'package:flutter/material.dart';

import 'navigate_event.dart';

class NavigatorHelper {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static navigate(
    NavigateEvent event,
    void Function(dynamic) onResponse,
  ) async {
    switch (event.type) {
      case NavigationType.push:
        var response = await push(event.route!);
        onResponse.call(response);
        return;
      case NavigationType.pushAndRemoveUntil:
        var response = await pushAndRemoveUntil(event.route!, event.predicate!);
        onResponse.call(response);
        return;
      case NavigationType.pushNamed:
        var response = await pushNamed(
          event.routeName!,
          arguments: event.arguments,
        );
        onResponse.call(response);
        return;
      case NavigationType.pushNamedAndRemoveUntil:
        var response = await pushNamedAndRemoveUntil(
          event.routeName!,
          event.predicate!,
          arguments: event.arguments,
        );
        onResponse.call(response);
        return;
      case NavigationType.pushReplacement:
        var response = await pushReplacement(event.route!);
        onResponse.call(response);
        return;
      case NavigationType.pushReplacementNamed:
        var response = await pushReplacementNamed(
          event.routeName!,
          arguments: event.arguments,
        );
        onResponse.call(response);
        return;
      case NavigationType.popAndPushNamed:
        var response = await popAndPushNamed(
          event.routeName!,
          result: event.result,
          arguments: event.arguments,
        );
        onResponse.call(response);
        return;
      case NavigationType.popUntil:
        popUntil(event.predicate!);
        return;
      case NavigationType.pop:
        pop(event.result);
        return;
    }
  }

  static Future<T?>? push<T>(Route<T> route) {
    return state?.push(route);
  }

  static Future<T?>? pushAndRemoveUntil<T>(
      Route<T> newRoute, RoutePredicate predicate) {
    return state?.pushAndRemoveUntil(newRoute, predicate);
  }

  static Future<T?>? pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return state?.pushNamed(routeName, arguments: arguments);
  }

  static Future<T?>? pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return state?.pushNamedAndRemoveUntil(newRouteName, predicate,
        arguments: arguments);
  }

  static Future<T?>? pushReplacement<T extends Object?, TO extends Object?>(
      Route<T> newRoute,
      {TO? result}) {
    return state?.pushReplacement(newRoute, result: result);
  }

  static Future<T?>?
      pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return state?.pushReplacementNamed(routeName,
        result: result, arguments: arguments);
  }

  static Future<T?>? popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return state?.popAndPushNamed(routeName,
        result: result, arguments: arguments);
  }

  static FutureOr<dynamic> popUntil(RoutePredicate predicate) {
    state?.popUntil(predicate);
  }

  static FutureOr<dynamic> pop<T extends Object?>([T? result]) {
    state?.pop(result);
  }

  static bool? canPop() => state?.canPop();

  static Future<bool?> maybePop<T extends Object?>([T? result]) async {
    return state?.maybePop();
  }

  static NavigatorState? get state => navigatorKey.currentState;
}
