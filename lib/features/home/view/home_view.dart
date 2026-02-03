import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/home/controller/category_controller.dart';
import 'package:food_delivery_app/features/home/controller/restaurant_controller.dart';
import 'package:food_delivery_app/features/home/widgets/category_card.dart';
import 'package:food_delivery_app/features/home/widgets/custom_header.dart';
import 'package:food_delivery_app/features/home/widgets/custom_restaurant_card.dart';
import 'package:food_delivery_app/features/home/widgets/custom_search.dart';
import 'package:get/get.dart';

class HomeView extends GetView<RestaurantController> {
  HomeView({super.key});
  final CategoryController categoryController = CategoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomHeader(
              onTap: () {
                Get.find<AuthController>().logout();
              },
            ),
            const SizedBox(height: 20),
            _welcomeText(),
            const SizedBox(height: 20),
            CustomSearch(onTap: () => Get.toNamed(AppRoute.search)),
            const SizedBox(height: 30),
            _categories(),
            const SizedBox(height: 20),
            Obx(() {
              if (categoryController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (categoryController.categoryList.isEmpty) {
                return const Center(child: Text('No categories found.'));
              }
              return SizedBox(
                height: 170,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  itemCount: categoryController.categoryList.length,
                  itemBuilder: (context, index) {
                    final category = categoryController.categoryList[index];
                    return CategoryCard(category: category);  
                  },
                ),
              );
            }),
            const SizedBox(height: 30),
            _openRestaurants(),
            const SizedBox(height: 20),
            const CustomRestaurantCard(),
            const SizedBox(height: 120),
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
            const Text(
              "Welcome back, ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
                fontFamily: 'Sen',
              ),
            ),
            const Text(
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
          const Text(
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
              const Text(
                "See all",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                  fontFamily: 'Sen',
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
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
          const Text(
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
              const Text(
                "See all",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                  fontFamily: 'Sen',
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
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
