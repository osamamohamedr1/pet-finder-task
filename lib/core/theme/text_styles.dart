import 'package:flutter/material.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';

class TextStyles {
  TextStyles._();

  // App Title
  static const TextStyle appTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  // Pet Name
  static const TextStyle petName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  // Pet Info (Gender, Age)
  static const TextStyle petInfo = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ColorsManager.textSecondary,
  );

  // Distance
  static const TextStyle distance = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ColorsManager.distance,
  );

  // Category Text Selected
  static const TextStyle categorySelected = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorsManager.categoryTextSelected,
  );

  // Category Text Unselected
  static const TextStyle categoryUnselected = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorsManager.categoryTextUnselected,
  );

  // Search Hint
  static const TextStyle searchHint = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textGrey,
  );

  // Section Title
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  // Body Text
  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textSecondary,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textGrey,
  );
}
