import 'package:currencywithstrapi/screens/auth/login/login_view.dart';
import 'package:currencywithstrapi/screens/calculation/view/calculation_view.dart';
import 'package:currencywithstrapi/screens/home/view/home_view.dart';
import 'package:currencywithstrapi/screens/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static final MyRoutes _instance = MyRoutes._init();
  static MyRoutes get instance => _instance;
  MyRoutes._init();
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch (s.name) {
      case "/home":
        return MaterialPageRoute(builder: (ctx) => const HomeView());
      case "/login":
        return MaterialPageRoute(builder: (ctx) => LoginView());
      case "/splash":
        return MaterialPageRoute(builder: (ctx) => const SplashView());
      case "/calculation":
        return MaterialPageRoute(builder: (ctx) => CalculationView());
    }
  }
}
