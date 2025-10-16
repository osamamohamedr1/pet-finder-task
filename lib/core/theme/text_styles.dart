import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';

class TextStyles {
  TextStyles._();

  // App Title
  static TextStyle appTitle = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  // Pet Name
  static TextStyle petName = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  // Pet Info (Gender, Age)
  static TextStyle petInfo = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: ColorsManager.textSecondary,
  );

  // Distance
  static TextStyle distance = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.distance,
  );

  // Category Text Selected
  static TextStyle categorySelected = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.categoryTextSelected,
  );

  // Category Text Unselected
  static TextStyle categoryUnselected = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.categoryTextUnselected,
  );

  // Search Hint
  static TextStyle searchHint = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textGrey,
  );

  // Section Title
  static TextStyle sectionTitle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  // Body Text
  static TextStyle bodyText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textSecondary,
  );

  // Caption
  static TextStyle caption = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textGrey,
  );
}
