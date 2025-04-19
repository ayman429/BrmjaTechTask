import 'package:flutter/material.dart';

import '../../core/utils/constant/app_color.dart';
import '../../core/utils/constant/app_string.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_button_auth.dart';
import 'components/phone_text_field.dart';
import 'components/logo.dart';
import 'components/password_text_field.dart';
import 'components/switch_sign_up_sign_in.dart';
import 'sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor1,
      appBar: customAppBar(title: AppString.signIn),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Logo(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      PhoneTextField(
                        phoneController: phoneController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return AppString.fieldRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextField(
                        passwordController: passwordController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return AppString.fieldRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtonAuth(
                        type: AppString.signIn,
                        formKey: formKey,
                        phoneController: phoneController,
                        passwordController: passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SwitchSignUpSignIn(
                        text1: AppString.noAccount,
                        text2: AppString.signUp,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
