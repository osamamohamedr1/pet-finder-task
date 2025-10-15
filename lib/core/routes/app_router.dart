import 'package:flutter/material.dart';
import 'package:pet_finder/core/routes/routes.dart';
import 'package:pet_finder/features/pets/presentation/views/pets_view.dart';
// import 'package:pet_finder/feature/bottom_nav_bar/presentation/views/bottom_bar.dart';
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
      // case Routes.login:
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginView(),
      //   );
      // case Routes.signUp:
      //   return MaterialPageRoute(
      //     builder: (_) => const SignUpView(),
      //   );
      case Routes.petsView:
        return MaterialPageRoute(builder: (_) => const PetsView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route found in ${settings.name}')),
          ),
        );
    }
  }
}
