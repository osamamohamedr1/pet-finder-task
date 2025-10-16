import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/routes/app_router.dart';
import 'package:pet_finder/core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const PetsFinder());
}

class PetsFinder extends StatelessWidget {
  const PetsFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 914), // iPhone 11 Pro design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Pet Finder',
          theme: ThemeData(useMaterial3: true, fontFamily: 'SF Pro Display'),
          initialRoute: Routes.home,
          onGenerateRoute: AppRouter().generateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
