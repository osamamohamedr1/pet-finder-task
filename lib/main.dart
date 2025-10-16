import 'package:flutter/material.dart';
import 'package:pet_finder/core/routes/app_router.dart';
import 'package:pet_finder/core/routes/routes.dart';

void main() {
  runApp(const PetsFinder());
}

class PetsFinder extends StatelessWidget {
  const PetsFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Finder',
      theme: ThemeData(useMaterial3: true, fontFamily: 'SF Pro Display'),
      initialRoute: Routes.home,
      onGenerateRoute: AppRouter().generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
