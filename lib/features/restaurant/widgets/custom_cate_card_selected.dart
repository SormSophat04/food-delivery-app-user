import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/restaurant/controller/food_controller.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';

class CustomCateCardSelected extends GetView<FoodController> {
  final String name;
  final String foodimage;
  const CustomCateCardSelected(
      {super.key, required this.foodimage, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 148,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Container(
              height: 145,
              width: 148,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: AppColors.greyColor.withOpacity(0.2),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFoodName(name: name),
                  SizedBox(height: 2),
                  _buildRestaurantName(),
                  SizedBox(
                    height: 2,
                  ),
                  _buildPriceAndAddtbn()
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 12,
            right: 12,
            child: Container(
              height: 94,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(foodimage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddtbn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$19',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
            fontFamily: 'Sen',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        CircleAvatar(
          radius: 12,
          backgroundColor: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/icons/Plus.png',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodName({required String name}) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
        fontFamily: 'Sen',
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRestaurantName() {
    return Text(
      'Restaurant Name',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.greyColor,
        fontFamily: 'Sen',
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
