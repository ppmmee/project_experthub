import 'package:flutter/material.dart';

// Screens
import '../views/screens/auth/auth_screen.dart';

// Configs
const String authRoute = '/auth';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => const AuthScreen());
    }
  }
}