import 'package:catbreeds/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCatBreeds extends StatelessWidget {
  const LoadingCatBreeds({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 10.sp),
      itemCount: 2,
      itemBuilder: (_, __) => const SkeletonCatBreed(),
      separatorBuilder: (_, __) => gapH12,
    );
  }
}

class SkeletonCatBreed extends StatelessWidget {
  const SkeletonCatBreed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sp),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Color.fromARGB(31, 143, 143, 143),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SmallShimmer(),
            gapH12,
            const Center(
              child: BiggerShimmer(),
            ),
            gapH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallShimmer(width: 100.sp),
                SmallShimmer(width: 70.sp),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SmallShimmer extends StatelessWidget {
  const SmallShimmer({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 243, 243, 243),
      highlightColor: const Color.fromARGB(255, 224, 224, 224),
      child: Container(
        width: width ?? 100.sp,
        height: height ?? 20.sp,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.sp),
        ),
      ),
    );
  }
}

class BiggerShimmer extends StatelessWidget {
  const BiggerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 243, 243, 243),
      highlightColor: const Color.fromARGB(255, 224, 224, 224),
      child: Container(
        width: double.infinity,
        height: 200.sp,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.sp),
        ),
      ),
    );
  }
}
