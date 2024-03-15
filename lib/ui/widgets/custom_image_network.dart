import 'package:catbreeds/ui/animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomImageNetwork extends StatelessWidget {
  final String image;
  final BoxFit? fit;

  const CustomImageNetwork({
    super.key,
    required this.image,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      alignment: Alignment.topCenter,
      fit: fit ?? BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return LottieBuilder.asset(AnimationsAssets.catLoading);
      },
      errorBuilder: (context, error, stackTrace) =>
          LottieBuilder.asset(AnimationsAssets.catError),
    );
  }
}
