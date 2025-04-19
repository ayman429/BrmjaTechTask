import 'package:flutter/material.dart';

import '../../core/utils/constant/app_color.dart';
import '../../core/utils/constant/app_string.dart';
import 'components/custom_app_bar.dart';
import 'sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor1,
      appBar: customAppBar(
        title: AppString.signIn,
        leading: IconButton(
          icon: const Icon(
            Icons.logout,
            color: AppColor.primaryColor,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ));
          },
        ),
      ),
      body: const Center(
          child: Text(
        "welcome to home page",
        style: TextStyle(color: AppColor.primaryColor, fontSize: 20),
      )),
    );
  }
}
