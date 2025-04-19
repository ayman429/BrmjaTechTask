import 'package:flutter/material.dart';

import 'Authentication/presentation/splash_screen.dart';
import 'core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrmjaTech',
      home: SplashScreen(),
    );
  }
}
