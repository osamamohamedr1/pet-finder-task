import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_finder/core/helpers/assets.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';
import 'package:pet_finder/features/pets/presentation/views/pets_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const PetsView(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildIcon(String activeIcon, String inactiveIcon, bool isActive) {
    return SvgPicture.asset(
      isActive ? activeIcon : inactiveIcon,
      width: 30.w,
      height: 30.h,
      colorFilter: ColorFilter.mode(
        isActive ? ColorsManager.iconActive : ColorsManager.iconInactive,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              blurRadius: 10.r,
              spreadRadius: 1.r,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorsManager.white,
          selectedItemColor: ColorsManager.iconActive,
          unselectedItemColor: ColorsManager.iconInactive,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 8,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(
                Assets.svgsHome2,
                Assets.svgsHome,
                _currentIndex == 0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                Assets.svgsHeart2,
                Assets.svgsHeart,
                _currentIndex == 1,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                Assets.svgsMessages,
                Assets.svgsMessages,
                _currentIndex == 2,
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                Assets.svgsProfileCircle,
                Assets.svgsProfileCircle,
                _currentIndex == 3,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
