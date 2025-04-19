import 'package:flutter/material.dart';

import '../../core/utils/constant/app_color.dart';
import '../../core/utils/constant/app_string.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_button_auth.dart';
import 'components/custom_otp_text_field.dart';

class Otp extends StatelessWidget {
  const Otp({super.key, required this.phoneController});
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController1 = TextEditingController();
    final TextEditingController otpController2 = TextEditingController();
    final TextEditingController otpController3 = TextEditingController();
    final TextEditingController otpController4 = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor1,
      appBar: customAppBar(
        title: AppString.otp,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            AppString.otpVerification,
            style: TextStyle(
              fontSize: 20,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            "${AppString.otpVerificationText} ",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${phoneController.text.substring(0, 3)}******${phoneController.text.substring(9, 11)}",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOtpTextField(otpController: otpController1),
                  CustomOtpTextField(otpController: otpController2),
                  CustomOtpTextField(otpController: otpController3),
                  CustomOtpTextField(otpController: otpController4),
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomButtonAuth(
              type: AppString.otp,
              phoneController: phoneController,
              otpController1: otpController1,
              otpController2: otpController2,
              otpController3: otpController3,
              otpController4: otpController4,
            ),
          ),
        ],
      ),
    );
  }
}
