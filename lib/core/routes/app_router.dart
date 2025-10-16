import 'package:flutter/material.dart';
import 'package:pet_finder/core/routes/routes.dart';
import 'package:pet_finder/features/bottom_bar/presentation/views/bottom_bar.dart';
import 'package:pet_finder/features/pets/data/models/breeds_model/breeds_model.dart';
import 'package:pet_finder/features/pets/presentation/views/pets_view.dart';
import 'package:pet_finder/features/pets/presentation/views/pet_detail_view.dart';
// import 'package:pet_finder/feature/login/presentation/views/login_view.dart';
// import 'package:pet_finder/feature/onboarding/presentation/views/onboarding_view.dart';
// import 'package:pet_finder/feature/sign_up/presentation/views/sign_up_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.onboarding:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnboardingView(),
      //   );

      case Routes.petsView:
        return MaterialPageRoute(builder: (_) => const PetsView());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const BottomBar());
      case Routes.petDetail:
        final args = settings.arguments as Map<String, dynamic>;
        final breed = args['breed'] as BreedsModel;
        final isFavorite = args['isFavorite'] as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => PetDetailView(breed: breed, isFavorite: isFavorite),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route found in ${settings.name}')),
          ),
        );
    }
  }
}
