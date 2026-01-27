import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/features/onboarding/widgets/custom_onboarding.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController _indicatorController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          SizedBox(height: 100, width: double.infinity),
          Expanded(
            child: PageView(
              controller: _indicatorController,
              onPageChanged: (value) {
                setState(() {
                  isLastPage = value == 3;
                });
              },
              children: [
                CustomOnboarding(
                  title: 'All your food',
                  subtitle:
                      'Get all your loved foods in one once place,you just place the order we do the rest',
                  jsonAnimation: 'assets/animated/Food.json',
                ),
                CustomOnboarding(
                  title: 'All your favorites',
                  subtitle:
                      'Get all your loved foods in one once place,you just place the order we do the rest',
                  jsonAnimation:
                      'assets/animated/Delivery Service-Delivery man.json',
                ),
                CustomOnboarding(
                  title: 'All your favorites',
                  subtitle:
                      'Get all your loved foods in one once place,you just place the order we do the rest',
                  jsonAnimation: 'assets/animated/Food.json',
                ),
                CustomOnboarding(
                  title: 'Order from choosen chef',
                  subtitle:
                      'Get all your loved foods in one once place,you just place the order we do the rest',
                  jsonAnimation: 'assets/animated/Stylish Dog.json',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildIndicator(),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _button(),
          ),
          SizedBox(height: 14),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return SmoothPageIndicator(
      controller: _indicatorController,
      count: 4,
      effect: WormEffect(
        dotColor: AppColors.primaryColor.withOpacity(0.3),
        activeDotColor: AppColors.primaryColor,
        dotHeight: 12,
        dotWidth: 12,
      ),
    );
  }

  Widget _button() {
    return Column(
      children: [
        isLastPage
            ? CustomButton(
                btntext: 'Done',
                btnicon: '',
                onTap: () {
                  Get.offNamed('/authWapper');
                },
              )
            : CustomButton(
                btntext: 'Next',
                btnicon: '',
                onTap: () {
                  _indicatorController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),
        SizedBox(height: 6),
        TextButton(
          onPressed: () {
            _indicatorController.jumpToPage(3);
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
