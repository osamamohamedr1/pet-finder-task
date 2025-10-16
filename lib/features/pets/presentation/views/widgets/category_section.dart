import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/category_chip.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    'All',
    'Cats',
    'Dogs',
    'Birds',
    'Fish',
    'Reptiles',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
