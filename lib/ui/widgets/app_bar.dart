// ignore_for_file: overridden_fields

import 'package:catbreeds/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends AppBar {
  final String text;

  @override
  final Widget? title;

  CustomAppBar({
    super.leading,
    super.key,
    super.backgroundColor = Colors.transparent,
    super.scrolledUnderElevation = 0,
    required this.text,
  }) : title = CustomText(
          text: text,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        );
}
