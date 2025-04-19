import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../../core/utils/constant/app_color.dart';
import '../../core/utils/constant/app_string.dart';
import '../../core/utils/flutter_secure_storage.dart';
import 'components/logo.dart';
import 'home_page.dart';
import 'sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasToken = false;
  hasTokenFunc() async {
    String token = await storage.read(key: AppString.tokenKey) ?? "no value";
    String verify = await storage.read(key: AppString.verifyKey) ?? "no value";
    if (token != "no value" && verify != "no value") {
      setState(() {
        hasToken = true;
      });
    } else {
      setState(() {
        hasToken = false;
      });
    }
  }

  @override
  void initState() {
    hasTokenFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor1,
      body: AnimatedSplashScreen(
        backgroundColor: AppColor.backgroundColor1,
        animationDuration: const Duration(milliseconds: 500),
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 500,
        splash: Logo(),
        nextScreen: hasToken ? const HomePage() : const SignIn(),
      ),
    );
  }
}
