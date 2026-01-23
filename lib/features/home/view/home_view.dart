import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_category_card.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/home/widgets/custom_header.dart';
import 'package:food_delivery_app/features/home/widgets/custom_restaurant_card.dart';
import 'package:food_delivery_app/features/home/widgets/custom_search.dart';
import 'package:get/get.dart';

class HomeView extends GetView<AuthController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomHeader(
              onTap: () {
                controller.logout();
              },
            ),
            SizedBox(height: 20),
            _welcomeText(),
            SizedBox(height: 20),
            CustomSearch(onTap: () => Get.toNamed('/search')),
            SizedBox(height: 30),
            _categories(),
            SizedBox(height: 20),
            CustomCategoryCard(),
            SizedBox(height: 30),
            _openRestaurants(),
            SizedBox(height: 20),
            CustomRestaurantCard(),
            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _welcomeText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text(
              "Welcome back, ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
                fontFamily: 'Sen',
              ),
            ),
            Text(
              "Ronaldo!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.bgBlack,
                fontFamily: 'Sen',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "All Categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontFamily: 'Sen',
            ),
          ),
          Row(
            children: [
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                  fontFamily: 'Sen',
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _openRestaurants() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Open Restaurants",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontFamily: 'Sen',
            ),
          ),
          Row(
            children: [
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                  fontFamily: 'Sen',
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
