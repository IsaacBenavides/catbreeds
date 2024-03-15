import 'package:catbreeds/models/cat_breeds.dart';
import 'package:catbreeds/modules/detail_catbreeds/widgets/linear_indicator_with_title.dart';
import 'package:catbreeds/ui/widgets/custom_text.dart';
import 'package:catbreeds/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CharacteristicList extends StatelessWidget {
  final CatBreed catBreed;

  const CharacteristicList({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Characteristics",
          color: Colors.purple,
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
        ),
        gapH24,
        LifeTimeContainer(catBreed: catBreed),
        gapH16,
        OriginContainer(catBreed: catBreed),
        gapH16,
        LinearIndicatorWithTitle(
          title: "Inteligence",
          points: catBreed.intelligence ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Adaptability",
          points: catBreed.adaptability ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Affection Level",
          points: catBreed.affectionLevel ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Child Friendly",
          points: catBreed.childFriendly ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Dog Friendly",
          points: catBreed.dogFriendly ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Energy Level",
          points: catBreed.energyLevel ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Grooming",
          points: catBreed.grooming ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Health Issues",
          points: catBreed.healthIssues ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Intelligence",
          points: catBreed.intelligence ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Shedding Level",
          points: catBreed.sheddingLevel ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Social Needs",
          points: catBreed.socialNeeds ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Stranger Friendly",
          points: catBreed.strangerFriendly ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Vocalisation",
          points: catBreed.vocalisation ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Experimental",
          points: catBreed.experimental ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Hairless",
          points: catBreed.hairless ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Natural",
          points: catBreed.natural ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Rare",
          points: catBreed.rare ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Rex",
          points: catBreed.rex ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Suppressed Tail",
          points: catBreed.suppressedTail ?? 0,
        ),
        gapH14,
        LinearIndicatorWithTitle(
          title: "Short Legs",
          points: catBreed.shortLegs ?? 0,
        ),
      ],
    );
  }
}

class LifeTimeContainer extends StatelessWidget {
  final CatBreed catBreed;

  const LifeTimeContainer({
    super.key,
    required this.catBreed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Life Span",
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
        gapH4,
        CustomText(text: "${catBreed.lifeSpan ?? 0} Years")
      ],
    );
  }
}

class OriginContainer extends StatelessWidget {
  final CatBreed catBreed;

  const OriginContainer({
    super.key,
    required this.catBreed,
  });

  @override
  Widget build(BuildContext context) {
    final countryFlag =
        "https://purecatamphetamine.github.io/country-flag-icons/3x2/${catBreed.countryCode}.svg";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Origin",
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
        gapH12,
        Row(
          children: [
            SvgPicture.network(
              countryFlag,
              height: 20.sp,
              width: 20.sp,
            ),
            gapW8,
            CustomText(text: catBreed.origin ?? "")
          ],
        ),
      ],
    );
  }
}
