import 'package:flutter/widgets.dart';
import 'package:joseph_prueba/app/router/routes.dart';
import 'package:joseph_prueba/home/view/home_page.dart';
import 'package:joseph_prueba/login/view/login_page.dart';

abstract class AppRoute {
  static String initial = Routes.splash;
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.login: (context) => const LoginPage(),
    Routes.home: (context) => const HomePage(),
  };
}