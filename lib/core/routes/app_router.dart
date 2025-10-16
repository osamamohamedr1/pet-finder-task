import 'package:flutter/material.dart';
import 'package:pet_finder/core/routes/routes.dart';
import 'package:pet_finder/features/bottom_bar/presentation/views/bottom_bar.dart';
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
        return MaterialPageRoute(
          builder: (_) => PetDetailView(
            name: args['name'] as String,
            gender: args['gender'] as String,
            age: args['age'] as String,
            weight: args['weight'] as String,
            distance: args['distance'] as String,
            imagePath: args['imagePath'] as String,
            about: args['about'] as String,
            isFavorite: args['isFavorite'] as bool? ?? false,
            price: args['price'] as String?,
          ),
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
