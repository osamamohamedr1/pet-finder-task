import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/helpers/spacing.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';
import 'package:pet_finder/core/theme/text_styles.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/info_chip.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/pet_detail_header.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/adopt_button.dart';

class PetDetailView extends StatefulWidget {
  final String name;
  final String gender;
  final String age;
  final String weight;
  final String distance;
  final String imagePath;
  final String about;
  final bool isFavorite;
  final String? price;

  const PetDetailView({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    required this.weight,
    required this.distance,
    required this.imagePath,
    required this.about,
    this.isFavorite = false,
    this.price,
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          PetDetailHeader(
            imagePath: widget.imagePath,
            isFavorite: _isFavorite,
            onFavoriteTap: _toggleFavorite,
            onBackTap: () => Navigator.pop(context),
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
                                widget.name,
                                style: TextStyles.font28BlackBold,
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 18.sp,
                                    color: ColorsManager.distance,
                                  ),
                                  horizontalSpace(2),
                                  Text(
                                    widget.distance,
                                    style: TextStyles.font14GreyNormal,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Text(
                          widget.price!,
                          style: TextStyles.font24BlackBold.copyWith(
                            color: ColorsManager.primary,
                            fontSize: 26.sp,
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(20),

                    Row(
                      children: [
                        Expanded(
                          child: InfoChip(
                            label: 'Gender',
                            value: widget.gender,
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: InfoChip(label: 'Age', value: widget.age),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: InfoChip(
                            label: 'Weight',
                            value: widget.weight,
                          ),
                        ),
                      ],
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
                      widget.about,
                      style: TextStyles.font14GreyDarkRegular.copyWith(
                        height: 1.6,
                      ),
                    ),

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
