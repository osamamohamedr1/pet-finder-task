import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder/core/helpers/assets.dart';
import 'package:pet_finder/core/helpers/spacing.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';
import 'package:pet_finder/core/theme/text_styles.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final String distance;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onCardTap;

  const PetCard({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
    required this.imagePath,
    this.isFavorite = false,
    required this.onFavoriteTap,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: ColorsManager.cardBackground,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 4.r,
              spreadRadius: .5.r,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 120.w,
              height: 116.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),

              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name, style: TextStyles.font18BlackBold),
                    verticalSpace(4),
                    Text(gender, style: TextStyles.font14GreyNormal),
                    Text(age, style: TextStyles.font14GreyNormal),
                    verticalSpace(8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18.sp,
                          color: ColorsManager.distance,
                        ),
                        horizontalSpace(2),
                        Text(distance, style: TextStyles.font14GreyNormal),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: GestureDetector(
                  onTap: onFavoriteTap,
                  child: SvgPicture.asset(
                    isFavorite ? Assets.svgsHeart2 : Assets.svgsHeart,
                    width: 30.w,
                    height: 24.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
