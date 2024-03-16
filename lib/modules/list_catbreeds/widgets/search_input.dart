import 'package:catbreeds/ui/icons/icons.dart';
import 'package:catbreeds/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchInput extends StatelessWidget {
  final Function() onSubmit;
  final Function()? onIconAction;
  final TextEditingController controller;

  const SearchInput({
    super.key,
    this.onIconAction,
    required this.onSubmit,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.done,
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 14.sp,
        ),
        onEditingComplete: () {
          context.unfocus();
          onSubmit();
        },
        decoration: InputDecoration(
          labelText: "Search",
          suffixIcon: GestureDetector(
            onTap: () {
              if (onIconAction != null) onIconAction!();
              context.unfocus();
            },
            child: controller.text.isNotEmpty
                ? const Icon(Icons.close, color: Colors.red)
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.sp, vertical: 13.sp),
                    child: SvgPicture.asset(IconAssets.search),
                  ),
          ),
          labelStyle: GoogleFonts.poppins(
            color: Colors.black87,
            fontSize: 14.sp,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.grey.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              width: 2,
              color: Colors.grey.withOpacity(.3),
            ),
          ),
        ),
      ),
    );
  }
}
