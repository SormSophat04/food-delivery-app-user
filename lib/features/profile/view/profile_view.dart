import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

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
            SizedBox(height: 70),
            _buildImageProfile(),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
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
          CircleAvatar(radius: 40),
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
