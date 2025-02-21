import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();
  BuildContext get context => navigatorKey.currentState!.context;

  // Navigate to a named route with an optional argument
  Future<dynamic>? navigateTo(String routeName, {dynamic argument}) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushNamed(routeName, arguments: argument);
    }
    return null;
  }

  // Navigate to a named route and replace the current one
  Future<dynamic>? navigateToReplace(String routeName, {dynamic arguments}) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    }
    return null;
  }

  // Navigate to a named route and remove all routes below it
  Future<dynamic>? navigateToAndRemoveUntil(String routeName, {dynamic argument}) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: argument);
    }
    return null;
  }

  Future<dynamic> navigateToAndRemoveUntilWidget(Widget route) {
    return navigatorKey.currentState!
        .pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> route), (route) => false);
  }

  // Push a route and remove all previous routes
  Future<dynamic>? pushAndRemoveUntil(Widget child) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushAndRemoveUntil(
        _buildPageRoute(child),
            (route) => false,
      );
    }
    return null;
  }

  // Navigate to a route built from a widget
  Future<dynamic> navigateToRoute(Widget route) {
    return navigatorKey.currentState!.push(_buildPageRoute(route));
  }

  // Push a route and replace the current one
  Future<dynamic>? pushReplacement(Widget route) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushReplacement(_buildPageRoute(route));
    }
    return null;
  }

  // Pop routes until a specific route is reached
  void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil((predicate) => predicate.settings.name == routeName);
  }

  bool canPop() {
    return navigatorKey.currentState?.canPop()?? false;
  }

  // Go back to the previous screen
  void goBack({dynamic value}) {
    navigatorKey.currentState?.pop(value);
  }

  // Helper function to create a MaterialPageRoute
  MaterialPageRoute _buildPageRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
