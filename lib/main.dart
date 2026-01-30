import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/bindings/initial_binding.dart';
import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:food_delivery_app/core/routes/app_screen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final supabaseUrl = 'https://eiubsohqeufvwywumvkk.supabase.co';
  final anonKey = 'sb_publishable_-9kgd610oo84i__fy6erUA_WfNTaLqf';

  print('Supabase URL: $supabaseUrl');
  print('Anon Key: $anonKey');

  if (supabaseUrl.isEmpty || anonKey.isEmpty) {
    print('ERROR: Missing Supabase credentials in .env file');
  }

  await Supabase.initialize(url: supabaseUrl, anonKey: anonKey);
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
