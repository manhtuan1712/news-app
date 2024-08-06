import 'package:flutter/material.dart';

class NavigationCenter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static const String loginScreen = 'login-screen';
  static const String signUpScreen = 'signup-screen';
  static const String mainScreen = 'main-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static goToScreen(
    BuildContext context,
    String name,
    Widget screen,
  ) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: RouteSettings(
            name: name,
          ),
          builder: (_) => screen,
        ),
      );
}
