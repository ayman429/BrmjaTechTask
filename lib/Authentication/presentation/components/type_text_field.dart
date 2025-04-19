import 'package:flutter/material.dart';

import '../../../core/utils/constant/app_string.dart';
import 'text_field_component.dart';

class TypeTextField extends StatelessWidget {
  const TypeTextField({
    super.key,
    required this.typeController,
    this.validator,
  });

  final TextEditingController typeController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFieldComponent(
      labelText: AppString.type,
      controller: typeController,
      hintText: AppString.enterType,
      validator: validator,
      // prefixIcon: const Icon(Icons.email),
    );
  }
}
