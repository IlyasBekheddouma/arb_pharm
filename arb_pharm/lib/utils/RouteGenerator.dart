import 'package:arb_pharm/ui/screens/LoginScreen.dart';
import 'package:arb_pharm/ui/screens/MainScreen.dart';
import 'package:arb_pharm/ui/screens/PendingScreen.dart';
import 'package:arb_pharm/ui/screens/SearchSceeen.dart';
import 'package:arb_pharm/ui/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:arb_pharm/ui/screens/SplachScreen.dart';

class RouteGenerator {
  //Map args = ModalRoute.of(context).settings.arguments;

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => SplachScreen(),
            settings: settings
        );
      case '/login':
        return MaterialPageRoute(
            builder: (_) => LoginScreen(),
            settings: settings
        );
      case '/main':
        return MaterialPageRoute(
            builder: (_) => MainScreen(),
            settings: settings
        );
      case '/signup':
        return MaterialPageRoute(
            builder: (_) => SignUpScreen(),
            settings: settings
        );
      case '/pending':
        return MaterialPageRoute(
            builder: (_) => PendingScreen(),
            settings: settings
        );
      case '/search':
        return MaterialPageRoute(
            builder: (_) => SearchSceeen(),
            settings: settings
        );
    }
  }
}