import 'package:flutter/material.dart';

import '../../../core/utils/constant/app_color.dart';

class SwitchSignUpSignIn extends StatelessWidget {
  const SwitchSignUpSignIn({
    super.key,
    required this.text1,
    required this.text2,
    required this.onPressed,
  });
  final String text1;
  final String text2;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      // spacing: 4,
      children: [
        Text(text1,
            style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text2,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
