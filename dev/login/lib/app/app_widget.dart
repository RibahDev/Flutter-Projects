
import 'package:flutter/material.dart';
import 'package:login/app/screens/login_screen.dart';
import 'package:login/routes/app_pages.dart';
import 'package:login/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppPages.pages,
      initialRoute: AppRoutes.login,
      debugShowCheckedModeBanner: false,
    );
  }
}