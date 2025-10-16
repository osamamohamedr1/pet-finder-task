import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/helpers/extensions.dart';
import 'package:pet_finder/core/helpers/spacing.dart';
import 'package:pet_finder/core/routes/routes.dart';
import 'package:pet_finder/core/theme/colors_manager.dart';
import 'package:pet_finder/core/theme/text_styles.dart';
import 'package:pet_finder/features/pets/presentation/cubit/breeds_cubit.dart';
import 'package:pet_finder/features/pets/presentation/cubit/breeds_state.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/category_section.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/custom_search_bar.dart';
import 'package:pet_finder/features/pets/presentation/views/widgets/pet_card.dart';

class PetsView extends StatefulWidget {
  const PetsView({super.key});

  @override
  State<PetsView> createState() => _PetsViewState();
}

class _PetsViewState extends State<PetsView> {
  final Set<String> _favoriteBreedIds = {};

  @override
  void initState() {
    super.initState();
    // Fetch breeds when the view is first loaded
    context.read<BreedsCubit>().fetchBreeds(limit: 20);
  }

  void _toggleFavorite(String breedId) {
    setState(() {
      if (_favoriteBreedIds.contains(breedId)) {
        _favoriteBreedIds.remove(breedId);
      } else {
        _favoriteBreedIds.add(breedId);
      }
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
              CategorySection(),

              verticalSpace(24),

              Expanded(
                child: BlocBuilder<BreedsCubit, BreedsState>(
                  builder: (context, state) {
                    if (state is BreedsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is BreedsError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64.sp,
                              color: ColorsManager.distance,
                            ),
                            verticalSpace(16),
                            Text(
                              'Failed to load breeds',
                              style: TextStyles.font18BlackBold,
                            ),
                            verticalSpace(8),
                            Text(
                              state.message,
                              style: TextStyles.font14GreyNormal,
                              textAlign: TextAlign.center,
                            ),
                            verticalSpace(16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<BreedsCubit>().retry(limit: 20);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.primary,
                                foregroundColor: ColorsManager.white,
                              ),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    } else if (state is BreedsSuccess) {
                      final breeds = state.breeds;

                      if (breeds.isEmpty) {
                        return Center(
                          child: Text(
                            'No breeds found',
                            style: TextStyles.font18BlackBold,
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: breeds.length,
                        itemBuilder: (context, index) {
                          final breed = breeds[index];
                          final breedId = breed.id ?? '';
                          final isFavorite = _favoriteBreedIds.contains(
                            breedId,
                          );

                          return PetCard(
                            breed: breed,
                            isFavorite: isFavorite,
                            onFavoriteTap: () => _toggleFavorite(breedId),
                            onCardTap: () {
                              context.pushNamed(
                                Routes.petDetail,
                                arguments: {
                                  'breed': breed,
                                  'isFavorite': isFavorite,
                                },
                              );
                            },
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
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
