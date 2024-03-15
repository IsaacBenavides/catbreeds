import 'package:catbreeds/modules/list_catbreeds/widgets/card_catbreed.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/models/cat_breeds.dart';
import 'package:catbreeds/ui/widgets/custom_refresh_indicator.dart';
import 'package:catbreeds/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catbreeds/modules/list_catbreeds/c_list_catbreeds.dart';
import 'package:provider/provider.dart';

class ListCatBreeds extends StatelessWidget {
  const ListCatBreeds({super.key});

  @override
  Widget build(BuildContext context) {
    final ListCatBreedsController controller = context.watch();
    return CustomRefreshIndicator(
      onRefresh: () async => controller.getCatBreeds(),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        itemBuilder: (_, index) {
          CatBreed catBreed = controller.catBreeds[index];
          return CardCatBreed(catBreed: catBreed);
        },
        separatorBuilder: (_, __) => gapH12,
        itemCount: controller.catBreedsAmount,
      ),
    );
  }
}
