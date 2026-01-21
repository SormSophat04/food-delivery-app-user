import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/features/presentation/home/widgets/custom_header.dart';
import 'package:food_delivery_app/features/presentation/home/widgets/custom_search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(),
          SizedBox(height: 20),
          _welcomeText(),
          SizedBox(height: 20),
          CustomSearch(),
          SizedBox(height: 30),
          _categories(),
        ],
      ),
    );
  }

  Widget _welcomeText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
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
          Spacer(),
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
