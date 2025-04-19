import 'package:flutter/material.dart';

import '../../../core/utils/constant/app_color.dart';

AppBar customAppBar({required String title, Widget? leading}) {
  return AppBar(
    backgroundColor: AppColor.backgroundColor2,
    surfaceTintColor: AppColor.backgroundColor2,
    shadowColor: AppColor.shadowColor,
    elevation: 4,
    leading: leading,
    title: Text(title,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
    centerTitle: true,
  );
}
