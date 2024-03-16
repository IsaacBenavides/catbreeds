import 'package:catbreeds/ui/animations/animations.dart';
import 'package:catbreeds/ui/routes/names.dart';
import 'package:catbreeds/ui/widgets/custom_text.dart';
import 'package:catbreeds/ui/widgets/scaffold_with_safe_area.dart';
import 'package:catbreeds/utils/extensions.dart';
import 'package:catbreeds/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => context.goToAndReplace(Routes.listcatbreeds, (_) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithSafeArea(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(AnimationsAssets.cat),
          gapH20,
          CustomText(
            text: "CatBreeds",
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
