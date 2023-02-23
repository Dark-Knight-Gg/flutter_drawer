import 'package:flutter/material.dart';

enum NavigationType {
  push,
  pushAndRemoveUntil,
  pushNamed,
  pushNamedAndRemoveUntil,
  pushReplacement,
  pushReplacementNamed,
  popAndPushNamed,
  popUntil,
  pop
}

class NavigateEvent<T> {
  final Route<T>? route;
  final RoutePredicate? predicate;
  final String? routeName;
  final dynamic arguments;
  final dynamic result;
  final NavigationType type;

  NavigateEvent._({
    required this.type,
    this.route,
    this.predicate,
    this.routeName,
    this.arguments,
    this.result,
  });

  NavigateEvent.push(Route<T> route)
      : this._(type: NavigationType.push, route: route);

  NavigateEvent.pushAndRemoveUntil(Route<T> route, RoutePredicate predicate)
      : this._(
          type: NavigationType.pushAndRemoveUntil,
          route: route,
          predicate: predicate,
        );

  NavigateEvent.pushNamed(
    String routeName, {
    Object? arguments,
  }) : this._(
          type: NavigationType.pushNamed,
          routeName: routeName,
          arguments: arguments,
        );

  NavigateEvent.pushNamedAndRemoveUntil(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) : this._(
          type: NavigationType.pushNamedAndRemoveUntil,
          routeName: routeName,
          predicate: predicate,
          arguments: arguments,
        );

  NavigateEvent.pushReplacement(Route<T> route, {dynamic result})
      : this._(
          type: NavigationType.pushReplacement,
          route: route,
          result: result,
        );

  NavigateEvent.pushReplacementNamed(
    String routeName, {
    dynamic result,
    dynamic arguments,
  }) : this._(
          type: NavigationType.pushReplacementNamed,
          routeName: routeName,
          result: result,
          arguments: arguments,
        );

  NavigateEvent.popAndPushNamed(
    String routeName, {
    dynamic result,
    dynamic arguments,
  }) : this._(
          type: NavigationType.popAndPushNamed,
          routeName: routeName,
          result: result,
          arguments: arguments,
        );

  NavigateEvent.popUntil(RoutePredicate predicate)
      : this._(type: NavigationType.popUntil, predicate: predicate);

  NavigateEvent.pop(dynamic result)
      : this._(type: NavigationType.pop, result: result);

  @override
  String toString() {
    return 'NavigateEvent{route: $route, predicate: $predicate, routeName: $routeName, arguments: $arguments, result: $result, type: $type}';
  }
}
