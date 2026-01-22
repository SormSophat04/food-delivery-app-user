import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(left: 15, right: 15, top: 50),
      child: Row(
        children: [
          _circleAvatar(),
          SizedBox(width: 18),
          _addressDefault(),
          Spacer(),
          _notificationIcon(),
        ],
      ),
    );
  }

  Widget _circleAvatar() {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.grey.shade200,
      child: Icon(Icons.person, color: Colors.grey),
    );
  }

  Widget _addressDefault() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DELIVERY TO",
          style: TextStyle(
            fontSize: 12,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700,
            fontFamily: 'Sen',
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text(
              "123 Main St",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
                fontFamily: 'Sen',
              ),
            ),
            Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black),
          ],
        ),
      ],
    );
  }

  Widget _notificationIcon() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey.shade200,
      child: Icon(Icons.notifications_none, color: Colors.grey),
    );
  }
}
