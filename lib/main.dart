import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/networking/api_service.dart';
import 'package:pet_finder/core/routes/app_router.dart';
import 'package:pet_finder/core/routes/routes.dart';
import 'package:pet_finder/features/pets/data/repositories/breeds_repository.dart';
import 'package:pet_finder/features/pets/presentation/cubit/breeds_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const PetsFinder());
}

class PetsFinder extends StatelessWidget {
  const PetsFinder({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize dependencies
    final dio = Dio();
    final apiService = ApiService(dio);
    final breedsRepository = BreedsRepositoryImpl(apiService);

    return ScreenUtilInit(
      designSize: const Size(375, 914), // iPhone 11 Pro design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => BreedsCubit(breedsRepository),
          child: MaterialApp(
            title: 'Pet Finder',
            theme: ThemeData(useMaterial3: true, fontFamily: 'SF Pro Display'),
            initialRoute: Routes.home,
            onGenerateRoute: AppRouter().generateRoute,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
