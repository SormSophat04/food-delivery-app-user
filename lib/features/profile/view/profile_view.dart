import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:food_delivery_app/features/profile/widgets/custom_item_profile.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 60),
            _buildImageProfile(),
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  CustomItemProfile(
                    title: 'Personal Info',
                    icon: 'assets/icons/user (1).png',
                    color: Colors.pink.shade200,
                    onTap: () => Get.toNamed(AppRoute.personalInfo),
                  ),
                  SizedBox(height: 16),
                  CustomItemProfile(
                    title: 'Address',
                    icon: 'assets/icons/user (1).png',
                    color: Colors.blue.shade200,
                    onTap: () => Get.toNamed(AppRoute.address),
                  ),
                  SizedBox(height: 16),
                  CustomItemProfile(
                    title: 'Payment Method',
                    icon: 'assets/icons/user (1).png',
                    color: Colors.blue.shade200,
                    onTap: () => Get.toNamed(AppRoute.card),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  CustomItemProfile(
                    title: 'Favorite',
                    icon: 'assets/icons/user (1).png',
                    color: Colors.pink.shade200,
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
                  CustomItemProfile(
                    title: 'Notification',
                    icon: 'assets/icons/user (1).png',
                    color: Colors.blue.shade200,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  CustomItemProfile(
                    title: 'FAQs',
                    icon: 'assets/icons/user (1).png',
                    color: Colors.pink.shade200,
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
                  CustomItemProfile(
                    title: 'User Reviews',
                    icon: 'assets/icons/user (1).png',
                    color: Colors.blue.shade200,
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
                  CustomItemProfile(
                    title: 'Settings',
                    icon: 'assets/icons/user (1).png',
                    color: Colors.blue.shade200,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  CustomItemProfile(
                    title: 'Logout',
                    icon: 'assets/icons/user (1).png',
                    color: Colors.red.shade500,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }

  Widget _buildImageProfile() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      // color: Colors.amber,
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.primaryColor.withOpacity(0.6),
          ),
          SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Justin Bieber",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Sen',
                  ),
                ),
                Text(
                  "I Love fast food",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor,
                    fontFamily: 'Sen',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
