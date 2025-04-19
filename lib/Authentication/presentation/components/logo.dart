import 'package:flutter/material.dart';

import '../../../core/utils/constant/app_string.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppString.logoImage,
      width: MediaQuery.of(context).size.width * 0.8,
    );
  }
}
