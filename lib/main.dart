import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/bindings/initial_binding.dart';
import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:food_delivery_app/core/routes/app_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ApiProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.splash,
          getPages: AppScreen.screens,
          initialBinding: InitialBinding(),
        );
      },
    );
  }
}
