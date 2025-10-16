import 'package:flutter/material.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';
import 'package:pet_finder/core/theme/text_styles.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.categorySelected
              : ColorsManager.categoryUnselected,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: isSelected
              ? TextStyles.categorySelected
              : TextStyles.categoryUnselected,
        ),
      ),
    );
  }
}
