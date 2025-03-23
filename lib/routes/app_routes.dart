import 'package:flutter/material.dart';
import 'package:student_details/presentation/homeScreen/home_screen.dart';
import 'package:student_details/presentation/splashScreen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splashScreen";

  static const String homeScreen = "/homeScreen";

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        homeScreen: HomeScreen.builder,
      };
}
