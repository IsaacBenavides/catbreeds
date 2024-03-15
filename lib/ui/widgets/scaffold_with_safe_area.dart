import 'package:catbreeds/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaffoldWithSafeArea extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool? top, bottom;
  const ScaffoldWithSafeArea({
    super.key,
    required this.body,
    this.appBar,
    this.top,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        top: top ?? true,
        bottom: bottom ?? true,
        child: Container(
          width: context.appSize.width,
          height: context.appSize.height,
          margin: EdgeInsets.symmetric(vertical: 10.sp),
          child: body,
        ),
      ),
    );
  }
}
