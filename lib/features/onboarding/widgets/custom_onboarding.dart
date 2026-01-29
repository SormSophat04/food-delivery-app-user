import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/app_colors.dart';

class CustomOnboarding extends StatelessWidget {
  final String title;
  final String subtitle;
  final String jsonAnimation;
  const CustomOnboarding(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.jsonAnimation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _card(),
          SizedBox(height: 60),
          _title(),
          SizedBox(height: 16),
          _subtitle(),
        ],
      ),
    );
  }

  Widget _card() {
    return Container(
        width: 240,
        height: 290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: AppColors.greyColor,
        ),
        child: LottieBuilder.asset(jsonAnimation, fit: BoxFit.contain));
  }

  Widget _title() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w800,
        fontFamily: 'Sen',
      ),
    );
  }

  Widget _subtitle() {
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Sen',
      ),
      textAlign: TextAlign.center,
    );
  }
}
