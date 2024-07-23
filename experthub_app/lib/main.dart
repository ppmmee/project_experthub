import 'package:flutter/material.dart';

// Utils
import 'utils/constants.dart';
import 'utils/routes.dart';

// Screens
import 'views/screens/auth/auth_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      home: const AuthScreen(),
      initialRoute: authRoute,
      onGenerateRoute: Routes().onGenerateRoute,
    );
  }
}
