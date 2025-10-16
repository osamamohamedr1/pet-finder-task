import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_finder/core/helpers/assets.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';

class PetDetailHeader extends StatelessWidget {
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onBackTap;
  final bool isNetworkImage;

  const PetDetailHeader({
    super.key,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onBackTap,
    this.isNetworkImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3.w,
                        color: ColorsManager.primary,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(Assets.imagesCat, fit: BoxFit.cover),
                  )
                : Image.asset(imagePath, fit: BoxFit.cover),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onBackTap,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .8),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: onFavoriteTap,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .8),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          isFavorite ? Assets.svgsHeart2 : Assets.svgsHeart,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
