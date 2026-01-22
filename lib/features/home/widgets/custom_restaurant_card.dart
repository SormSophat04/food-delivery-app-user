import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomRestaurantCard extends StatelessWidget {
  const CustomRestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 230,
            width: 300,
            margin: EdgeInsets.symmetric(horizontal: 5),
            // color: Colors.amber,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 205,
                    width: 250,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _restaurantName(),
                        SizedBox(height: 5),
                        _items(),
                        SizedBox(height: 5),
                        _aboutRestaurant(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 12,
                  right: 12,
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _restaurantName() {
    return Text(
      "Restaurant Name",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
        fontFamily: 'Sen',
      ),
    );
  }

  Widget _items() {
    return Text(
      "Italian, Chinese, Mexican",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.greyColor,
        fontFamily: 'Sen',
      ),
    );
  }

  Widget _aboutRestaurant() {
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
          "4.5",
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
          "Free",
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
