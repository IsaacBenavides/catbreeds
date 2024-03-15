import 'package:catbreeds/modules/list_catbreeds/c_list_catbreeds.dart';
import 'package:catbreeds/ui/animations/animations.dart';
import 'package:catbreeds/ui/widgets/custom_refresh_indicator.dart';
import 'package:catbreeds/ui/widgets/custom_text.dart';
import 'package:catbreeds/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class EmptyListCatBreeds extends StatelessWidget {
  const EmptyListCatBreeds({super.key});

  @override
  Widget build(BuildContext context) {
    final ListCatBreedsController controller = context.watch();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: CustomRefreshIndicator(
        onRefresh: () async => controller.getCatBreeds(),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                gapH84,
                LottieBuilder.asset(AnimationsAssets.catEmpty),
                gapH40,
                CustomText(
                  text:
                      "We don't find breeds with that name. Try another name or come back later.",
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
