import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';

class TextStyles {
  TextStyles._();

  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  static TextStyle font28BlackBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  static TextStyle font18BlackBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  static TextStyle font14GreyNormal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: ColorsManager.textSecondary,
  );

  static TextStyle font12RedMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.distance,
  );

  static TextStyle font14WhiteSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.categoryTextSelected,
  );

  static TextStyle font14TealSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.categoryTextUnselected,
  );

  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textGrey,
  );

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  static TextStyle font14GreyRegular2 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textSecondary,
  );

  static TextStyle font12GreyRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textGrey,
  );
}
