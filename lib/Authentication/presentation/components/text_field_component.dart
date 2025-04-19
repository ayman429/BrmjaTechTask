import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/constant/app_color.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    this.controller,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.textAlign,
    this.onChanged,
    this.labelText,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColor.primaryColor.withOpacity(0.3),
          selectionHandleColor: AppColor.primaryColor,
        ),
      ),
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: controller,
        cursorColor: AppColor.primaryColor,
        validator: validator,
        keyboardType: keyboardType,
        textAlign: textAlign ?? TextAlign.start,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        style: const TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: AppColor.primaryColor,
          suffixIconColor: AppColor.primaryColor,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
