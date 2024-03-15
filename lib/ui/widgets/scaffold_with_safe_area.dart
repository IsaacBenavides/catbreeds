import 'package:catbreeds/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaffoldWithSafeArea extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool? top, bottom, extendBodyBehindAppBar;
  final EdgeInsets? padding;

  const ScaffoldWithSafeArea({
    super.key,
    required this.body,
    this.appBar,
    this.top,
    this.bottom,
    this.padding,
    this.extendBodyBehindAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      appBar: appBar,
      body: SafeArea(
        top: top ?? true,
        bottom: bottom ?? true,
        child: Container(
          width: context.appSize.width,
          height: context.appSize.height,
          margin: padding ?? EdgeInsets.symmetric(vertical: 10.sp),
          child: body,
        ),
      ),
    );
  }
}
