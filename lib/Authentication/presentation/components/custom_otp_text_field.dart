import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text_field_component.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField({
    super.key,
    required this.otpController,
  });
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.height / 5,
      child: TextFieldComponent(
        controller: otpController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        hintText: "",
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
