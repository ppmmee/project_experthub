import 'package:flutter/material.dart';

// Screens
import '../views/screens/auth/auth_screen.dart';
import '../views/screens/auth/login_screen.dart';
import '../views/screens/auth/register_screen.dart';

// Configs
const String authRoute = '/auth';
const String loginRoute = '/login';
const String registerRoute = '/register';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => const AuthScreen());
    }
  }
}