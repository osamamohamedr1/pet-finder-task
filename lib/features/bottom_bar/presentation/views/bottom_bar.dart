import 'package:flutter/material.dart';
import 'package:pet_finder/features/bottom_bar/presentation/widgets/custom_bottom_nav_bar.dart';
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
    const Placeholder(), // Favorites screen - TODO
    const Placeholder(), // Messages screen - TODO
    const Placeholder(), // Profile screen - TODO
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
