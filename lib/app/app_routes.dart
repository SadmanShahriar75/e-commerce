import 'package:crafy_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafy_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> rountes(RouteSettings settings) {
    late Widget widget;
    if (settings.name == SplashScreen.name) {
      widget = SplashScreen();
    } else if (settings.name == SignUpScreen.name) {
      widget = SignUpScreen();
    }
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
