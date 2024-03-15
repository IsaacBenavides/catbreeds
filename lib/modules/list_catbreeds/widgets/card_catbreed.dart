import 'package:catbreeds/models/cat_breeds.dart';
import 'package:catbreeds/ui/animations/animations.dart';
import 'package:catbreeds/ui/widgets/custom_text.dart';
import 'package:catbreeds/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CardCatBreed extends StatelessWidget {
  final CatBreed catBreed;

  const CardCatBreed({
    super.key,
    required this.catBreed,
  });

  @override
  Widget build(BuildContext context) {
    final catImage =
        "${dotenv.get("IMAGES_BASE_URL")}${catBreed.referenceImageId}.jpg";
    return Card(
      elevation: 3,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: catBreed.name!,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                CustomText(
                  text: "See More ...",
                  fontSize: 13.sp,
                  color: Colors.purple,
                )
              ],
            ),
            gapH12,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              clipBehavior: Clip.antiAlias,
              child: AspectRatio(
                aspectRatio: 5 / 4,
                child: Image.network(
                  catImage,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return LottieBuilder.asset(AnimationsAssets.catLoading);
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      LottieBuilder.asset(AnimationsAssets.catError),
                ),
              ),
            ),
            gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: catBreed.origin!,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: "Inteligence: ${catBreed.intelligence!.toString()}",
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
