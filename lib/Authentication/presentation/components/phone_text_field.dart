import 'package:flutter/material.dart';

import '../../../core/utils/constant/app_string.dart';
import 'text_field_component.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.phoneController,
    this.validator,
  });

  final TextEditingController phoneController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFieldComponent(
      labelText: AppString.phone,
      controller: phoneController,
      keyboardType: TextInputType.phone,
      hintText: AppString.enterPhone,
      prefixIcon: const Icon(Icons.phone),
      validator: validator,
    );
  }
}
