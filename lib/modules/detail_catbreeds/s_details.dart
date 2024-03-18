import 'package:catbreeds/models/cat_breeds.dart';
import 'package:catbreeds/modules/detail_catbreeds/widgets/characteristics_list.dart';
import 'package:catbreeds/ui/widgets/app_bar.dart';
import 'package:catbreeds/ui/widgets/custom_image_network.dart';
import 'package:catbreeds/ui/widgets/custom_text.dart';
import 'package:catbreeds/ui/widgets/scaffold_with_safe_area.dart';
import 'package:catbreeds/utils/extensions.dart';
import 'package:catbreeds/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatBreedDetailsScreen extends StatelessWidget {
  const CatBreedDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CatBreed catBreed = context.getArguments() as CatBreed;
    final catImage =
        "${dotenv.get("IMAGES_BASE_URL")}${catBreed.referenceImageId}.jpg";

    return ScaffoldWithSafeArea(
      appBar: CustomAppBar(text: catBreed.name!),
      padding: EdgeInsets.only(bottom: 10.sp),
      body: Column(
        children: [
          SizedBox(
            height: context.appSize.height * .45,
            width: double.infinity,
            child: Hero(
              tag: catBreed.referenceImageId ?? "",
              child: CustomImageNetwork(image: catImage),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                padding: EdgeInsets.all(20.sp),
                children: [
                  CustomText(text: catBreed.description ?? ""),
                  gapH20,
                  CharacteristicList(catBreed: catBreed)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
