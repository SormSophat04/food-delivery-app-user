import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Container(height: 100, width: double.infinity),
          Expanded(
            child: Container(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _button(),
          ),
          SizedBox(height: 14),
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
        color: AppColors.greyColor,
      ),
    );
  }

  Widget _title() {
    return Text(
      'All Your Favorite',
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
      'Get all your loved foods in one once place, you just place the order we do the rest',
      style: TextStyle(
        fontSize: 16,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Sen',
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _button() {
    return Column(
      children: [
        CustomButton(
          btntext: 'NEXT',
          btnicon: '',
          onTap: () => Get.toNamed('/authWapper'),
        ),
        SizedBox(height: 6),
        TextButton(
          onPressed: () {
            Get.toNamed('/authWapper');
          },
          child: Text(
            "Skip",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w400,
              fontFamily: 'Sen',
            ),
          ),
        ),
      ],
    );
  }
}
