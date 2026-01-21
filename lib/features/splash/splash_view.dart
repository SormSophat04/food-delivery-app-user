import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed('/onBoarding');
    });
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
