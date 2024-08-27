import 'package:flutter/material.dart';
import 'package:login/app/screens/home_screen.dart';
import 'package:login/app/screens/login_screen.dart';
import 'package:login/routes/app_routes.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext context)> pages = {
    AppRoutes.login: (context) => const LoginScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
  };
}