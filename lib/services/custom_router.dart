import 'package:flutter/material.dart';
import 'package:flutter_realtime_test/screen/homepage/homepage.dart';
import 'package:flutter_realtime_test/screen/login/login.dart';

class CustomRouter {
  static const String base = "/";
  static const String homepage = "/homepage";
  static const String login = "/login";

  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case base:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case homepage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );
    }
  }
}
