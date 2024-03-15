import 'package:catbreeds/ui/widgets/custom_text.dart';
import 'package:catbreeds/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearIndicatorWithTitle extends StatelessWidget {
  const LinearIndicatorWithTitle({
    super.key,
    required this.title,
    required this.points,
  });

  final String title;
  final int points;

  @override
  Widget build(BuildContext context) {
    int lastElement = 4;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: title,
                fontWeight: FontWeight.w600,
              ),
            ),
            gapH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Container(
                  width: (width / 5) - 10.sp,
                  height: 10.sp,
                  margin: index < lastElement
                      ? EdgeInsets.only(right: 10.sp)
                      : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: index + 1 <= points ? Colors.purple : Colors.black12,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
