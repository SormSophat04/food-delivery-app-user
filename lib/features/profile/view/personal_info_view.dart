import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/profile/widgets/custom_item_profile.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              child: Column(
            children: [
              SizedBox(height: 110),
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
                      title: 'Ronaldo',
                      icon: 'assets/icons/user (1).png',
                      color: Colors.cyan.shade200,
                      onTap: () {},
                    ),
                    SizedBox(height: 16),
                    CustomItemProfile(
                      title: 'Ronaldo@gmail.com',
                      icon: 'assets/icons/credit-card.png',
                      color: Colors.redAccent.shade200,
                      onTap: () {},
                    ),
                    SizedBox(height: 16),
                    CustomItemProfile(
                      title: '092826623',
                      icon: 'assets/icons/Call.png',
                      color: Colors.green.shade200,
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          )),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: CustomTopbar(
              title: "Personal Info",
              actionIcon1: 'assets/icons/compose.png',
              bgColor: AppColors.greyBtn,
              cartNumber: '',
              actionIcon2: '',
            ),
          ),
        ],
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
