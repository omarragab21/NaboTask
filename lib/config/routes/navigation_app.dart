import 'package:flutter/material.dart';

class NavigationApp {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Navigate to named route
  static Future<void> pushNamed(String routeName, {Object? arguments}) async {
    await navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  /// Replace with named route
  static Future<void> pushReplacementNamed(String routeName,
      {Object? arguments}) async {
    await navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Push and remove until
  static Future<void> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// Pop current route
  static void pop([Object? result]) {
    navigatorKey.currentState?.pop(result);
  }
}
