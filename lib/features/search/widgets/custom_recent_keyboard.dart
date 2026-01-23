import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomRecentKeyboard extends StatelessWidget {
  const CustomRecentKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return Container(
            height: 46,
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(33),
            ),
            child: Center(
              child: Text(
                "Burger",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                  fontFamily: 'Sen',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
