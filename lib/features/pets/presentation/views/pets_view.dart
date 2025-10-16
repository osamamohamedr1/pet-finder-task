import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/helpers/assets.dart';
import 'package:pet_finder/core/helpers/spacing.dart';
import 'package:pet_finder/core/routes/routes.dart';
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
      'weight': '3 kg',
      'distance': '1.6 km away',
      'image': Assets.imagesCat,
      'isFavorite': false,
      'price': '\$50',
      'about':
          'Joli is a cute and playful kitten who is full of energy. She loves to play with toys and explore her surroundings. She is very friendly and affectionate.',
    },
    {
      'name': 'Tom',
      'gender': 'Male',
      'age': '1 year Old',
      'weight': '10 kg',
      'distance': '2.1 km away',
      'image': Assets.imagesCat,
      'isFavorite': false,
      'price': '\$95',
      'about':
          'Tom is a friendly and loyal Golden Retriever who loves being around people. He\'ll always be ready for a game of fetch. Tom enjoys morning walks, belly rubs, and taking long naps after playtime. He\'s very well with other pets, and makes the perfect family dog.',
    },
    {
      'name': 'Oliver',
      'gender': 'Male or Female',
      'age': '5 Months Old',
      'weight': '2 kg',
      'distance': '2 km away',
      'image': Assets.imagesCat,
      'isFavorite': false,
      'price': '\$45',
      'about':
          'Oliver is a curious and playful kitten. He loves to explore and play with toys. He is very friendly and affectionate.',
    },
    {
      'name': 'Shelly',
      'gender': 'Female',
      'age': '15 year Old',
      'weight': '8 kg',
      'distance': '2 km away',
      'image': Assets.imagesCat,
      'isFavorite': false,
      'price': '\$30',
      'about':
          'Shelly is a calm and gentle senior cat. She loves to cuddle and relax. She is very sweet and affectionate.',
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
        title: Text('Find Your Forever Pet', style: TextStyles.font24BlackBold),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: ColorsManager.textPrimary,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),

              CustomSearchBar(onFilterTap: () {}),

              verticalSpace(24),

              Text('Categories', style: TextStyles.font20BlackBold),

              verticalSpace(12),

              SizedBox(
                height: 36.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index < categories.length - 1 ? 8.w : 0,
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

              SizedBox(height: 24.h),

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
                        Navigator.pushNamed(
                          context,
                          Routes.petDetail,
                          arguments: {
                            'name': pet['name'],
                            'gender': pet['gender'],
                            'age': pet['age'],
                            'weight': pet['weight'] ?? '5 kg',
                            'distance': pet['distance'],
                            'imagePath': pet['image'],
                            'about':
                                pet['about'] ??
                                'This is a wonderful pet looking for a loving home.',
                            'isFavorite': pet['isFavorite'],
                            'price': pet['price'],
                          },
                        );
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
