import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder/core/helpers/assets.dart';
import 'package:pet_finder/core/helpers/spacing.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';
import 'package:pet_finder/core/theme/text_styles.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final String distance;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onCardTap;

  const PetCard({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
    required this.imagePath,
    this.isFavorite = false,
    required this.onFavoriteTap,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: ColorsManager.cardBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 116,
              height: 116,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),

              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name, style: TextStyles.petName),
                    verticalSpace(4),
                    Text(gender, style: TextStyles.petInfo),
                    Text(age, style: TextStyles.petInfo),
                    verticalSpace(8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 18,
                          color: ColorsManager.distance,
                        ),
                        horizontalSpace(2),
                        Text(distance, style: TextStyles.petInfo),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: onFavoriteTap,
                  child: SvgPicture.asset(
                    isFavorite ? Assets.svgsHeart2 : Assets.svgsHeart,
                    width: 30,
                    height: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
