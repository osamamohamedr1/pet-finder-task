import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            index: 0,
            iconPath: 'assets/svgs/home-2.svg',
            isActive: currentIndex == 0,
          ),
          _buildNavItem(
            index: 1,
            iconPath: 'assets/svgs/heart2.svg',
            isActive: currentIndex == 1,
          ),
          _buildNavItem(
            index: 2,
            iconPath: 'assets/svgs/messages.svg',
            isActive: currentIndex == 2,
          ),
          _buildNavItem(
            index: 3,
            iconPath: 'assets/svgs/profile-circle.svg',
            isActive: currentIndex == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconPath,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: SvgPicture.asset(
          iconPath,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            isActive ? ColorsManager.iconActive : ColorsManager.iconInactive,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
