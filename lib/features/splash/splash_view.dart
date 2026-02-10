import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/storage_keys.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _routeFromSplash();
  }

  Future<void> _routeFromSplash() async {
    await Future.delayed(const Duration(seconds: 1));

    final hasCompletedOnboarding =
        await _storage.read(key: StorageKeys.onboardingComplete) == 'true';

    if (!mounted) return;

    if (!hasCompletedOnboarding) {
      Get.offAllNamed(AppRoute.onBoarding);
      return;
    }

    final auth = Get.find<AuthController>();
    if (auth.isLoggedIn.value) {
      Get.offAllNamed(AppRoute.bottomnavbar);
    } else {
      Get.offAllNamed(AppRoute.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Center(
            child: FadeOutUp(
              child: Image.asset('assets/images/Logo.png', width: 130),
            ),
          ),
          Positioned(
            bottom: -200,
            right: -200,
            child: FadeInRight(
              child: Image.asset(
                'assets/images/Ellipse 1006.png',
                width: 400,
                height: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
