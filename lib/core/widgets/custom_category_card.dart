import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
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
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: AppColors.greyColor.withOpacity(0.2),
                          offset: Offset(0, 4),
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _catName(),
                        SizedBox(height: 4),
                        _startingPrice(),
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

  Widget _catName() {
    return Text(
      "Pizza",
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

  Widget _startingPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Starting',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
            fontFamily: 'Sen',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "\$18",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
            fontFamily: 'Sen',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
