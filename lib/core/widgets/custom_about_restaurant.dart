import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomAboutRestaurant extends StatelessWidget {
  final String rate;
  final bool isFree;
  const CustomAboutRestaurant(
      {super.key, required this.rate, required this.isFree});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/favorites.png',
          color: AppColors.primaryColor,
          height: 20,
          width: 20,
        ),
        SizedBox(width: 5),
        Text(
          rate,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
            fontFamily: 'Sen',
          ),
        ),
        SizedBox(width: 4),
        Text("•"),
        SizedBox(width: 4),
        Image.asset(
          'assets/icons/fast.png',
          color: AppColors.primaryColor,
          height: 25,
          width: 25,
        ),
        SizedBox(width: 5),
        Text(
          isFree ? "Free" : "Pair",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
            fontFamily: 'Sen',
          ),
        ),
        SizedBox(width: 4),
        Text("•"),
        SizedBox(width: 4),
        Image.asset(
          'assets/icons/clock.png',
          color: AppColors.primaryColor,
          height: 18,
          width: 18,
        ),
        SizedBox(width: 5),
        Text(
          "30-40 min",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
            fontFamily: 'Sen',
          ),
        ),
      ],
    );
  }
}
