import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/helpers/assets.dart';
import 'package:pet_finder/core/helpers/spacing.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';
import 'package:pet_finder/core/theme/text_styles.dart';
import 'package:pet_finder/features/pets/data/models/breeds_model/breeds_model.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/info_chip.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/pet_detail_header.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/adopt_button.dart';

class PetDetailView extends StatefulWidget {
  final BreedsModel breed;
  final bool isFavorite;

  const PetDetailView({
    super.key,
    required this.breed,
    this.isFavorite = false,
  });

  @override
  State<PetDetailView> createState() => _PetDetailViewState();
}

class _PetDetailViewState extends State<PetDetailView> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final breed = widget.breed;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          PetDetailHeader(
            imagePath: breed.imageUrl.isNotEmpty
                ? breed.imageUrl
                : Assets.imagesCat,
            isFavorite: _isFavorite,
            onFavoriteTap: _toggleFavorite,
            onBackTap: () => Navigator.pop(context),
            isNetworkImage: breed.imageUrl.isNotEmpty,
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(32),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                breed.name ?? 'Unknown',
                                style: TextStyles.font28BlackBold,
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.public,
                                    size: 18.sp,
                                    color: ColorsManager.distance,
                                  ),
                                  horizontalSpace(2),
                                  Text(
                                    breed.origin ?? 'Unknown',
                                    style: TextStyles.font14GreyNormal,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(20),

                    Row(
                      children: [
                        Expanded(
                          child: InfoChip(
                            label: 'Weight',
                            value: breed.weight?.metric ?? 'N/A',
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: InfoChip(
                            label: 'Life Span',
                            value: breed.lifeSpan ?? 'N/A',
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: InfoChip(
                            label: 'Affection',
                            value: '${breed.affectionLevel ?? 0}/5',
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(24),

                    Text(
                      'Temperament:',
                      style: TextStyles.font20BlackBold.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),

                    verticalSpace(8),

                    Text(
                      breed.temperament ?? 'Not specified',
                      style: TextStyles.font14GreyDarkRegular.copyWith(
                        height: 1.6,
                      ),
                    ),

                    verticalSpace(24),

                    Text(
                      'About:',
                      style: TextStyles.font20BlackBold.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),

                    verticalSpace(12),

                    Text(
                      breed.description ?? 'No description available.',
                      style: TextStyles.font14GreyDarkRegular.copyWith(
                        height: 1.6,
                      ),
                    ),

                    if (breed.wikipediaUrl != null &&
                        breed.wikipediaUrl!.isNotEmpty) ...[
                      verticalSpace(16),
                      TextButton.icon(
                        onPressed: () {
                          // TODO: Open Wikipedia URL
                        },
                        icon: Icon(Icons.info_outline, size: 20.sp),
                        label: const Text('Learn More'),
                        style: TextButton.styleFrom(
                          foregroundColor: ColorsManager.primary,
                        ),
                      ),
                    ],

                    verticalSpace(20),

                    AdoptButton(
                      onPressed: () {
                        // TODO: Implement adoption flow
                      },
                    ),

                    verticalSpace(24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
