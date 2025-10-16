import 'package:flutter/material.dart';
import 'package:pet_finder/core/helpers/assets.dart';
import 'package:pet_finder/core/helpers/spacing.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';
import 'package:pet_finder/core/theme/text_styles.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/category_chip.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/custom_search_bar.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/pet_card.dart';

class PetsView extends StatefulWidget {
  const PetsView({super.key});

  @override
  State<PetsView> createState() => _PetsViewState();
}

class _PetsViewState extends State<PetsView> {
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    'All',
    'Cats',
    'Dogs',
    'Birds',
    'Fish',
    'Reptiles',
  ];

  // Sample data - this will be replaced with API data later
  final List<Map<String, dynamic>> pets = [
    {
      'name': 'Joli',
      'gender': 'Female',
      'age': '5 Months Old',
      'distance': '1.6 km away',
      'image': Assets.imagesCat,
      'isFavorite': false,
    },
    {
      'name': 'Tom',
      'gender': 'Male',
      'age': '1 year Old',
      'distance': '2.1 km away',
      'image': Assets.imagesCat,
      'isFavorite': false,
    },
    {
      'name': 'Oliver',
      'gender': 'Male or Female',
      'age': '5 Months Old',
      'distance': '2 km away',
      'image': Assets.imagesCat,
      'isFavorite': false,
    },
    {
      'name': 'Shelly',
      'gender': 'Female',
      'age': '15 year Old',
      'distance': '2 km away',
      'image': Assets.imagesCat,
      'isFavorite': false,
    },
  ];

  void _toggleFavorite(int index) {
    setState(() {
      pets[index]['isFavorite'] = !pets[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Find Your Forever Pet', style: TextStyles.appTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: ColorsManager.textPrimary,
              size: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),

              CustomSearchBar(onFilterTap: () {}),

              verticalSpace(24),

              const Text('Categories', style: TextStyles.sectionTitle),

              verticalSpace(12),

              SizedBox(
                height: 36,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index < categories.length - 1 ? 8 : 0,
                      ),
                      child: CategoryChip(
                        label: categories[index],
                        isSelected: selectedCategoryIndex == index,
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Pets List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: pets.length,
                  itemBuilder: (context, index) {
                    final pet = pets[index];
                    return PetCard(
                      name: pet['name'],
                      gender: pet['gender'],
                      age: pet['age'],
                      distance: pet['distance'],
                      imagePath: pet['image'],
                      isFavorite: pet['isFavorite'],
                      onFavoriteTap: () => _toggleFavorite(index),
                      onCardTap: () {
                        // TODO: Navigate to detail screen
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
