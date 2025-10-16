import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';
import 'package:pet_finder/core/theme/text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: ColorsManager.background,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManager.borderLight, width: 1.w),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyles.searchHint,
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 26.sp),
          suffixIcon: FilterIcon(onFilterTap: onFilterTap),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
        ),
      ),
    );
  }
}

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key, required this.onFilterTap});

  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterTap,
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: ColorsManager.background,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: ColorsManager.borderLight, width: 1.w),
        ),
        child: Icon(Icons.tune, color: Colors.black, size: 20.sp),
      ),
    );
  }
}
