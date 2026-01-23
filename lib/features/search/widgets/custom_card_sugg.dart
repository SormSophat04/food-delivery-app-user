import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomCardSugg extends StatelessWidget {
  const CustomCardSugg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 234,
      // color: Colors.yellow,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: 3,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            height: 64,
            margin: EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              // color: Colors.blue,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.greyColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRestauarantName(),
                      SizedBox(height: 4),
                      _buildRating(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRestauarantName() {
    return Text(
      "Recenst Keyboard",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
        fontFamily: 'Sen',
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Image.asset(
          'assets/icons/favorites.png',
          width: 15,
          height: 15,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: 5),
        Text(
          "4.1",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
            fontFamily: 'Sen',
          ),
        ),
      ],
    );
  }
}
