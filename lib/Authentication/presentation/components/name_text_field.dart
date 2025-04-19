import 'package:flutter/material.dart';

import '../../../core/utils/constant/app_string.dart';
import 'text_field_component.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
    required this.nameController,
    this.validator,
  });

  final TextEditingController nameController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFieldComponent(
      labelText: AppString.name,
      controller: nameController,
      hintText: AppString.enterName,
      validator: validator,
      // prefixIcon: const Icon(Icons.email),
    );
  }
}
