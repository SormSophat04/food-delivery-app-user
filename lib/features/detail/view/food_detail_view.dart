import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/widgets/custom_about_restaurant.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/detail/controller/detail_controller.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';

class FoodDetailView extends GetView<DetailController> {
  const FoodDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 110),
                        _buildImageRestaurant(
                            img: controller.foods.image.toString()),
                        SizedBox(height: 24),
                        _buildFoodName(
                            foodName: controller.foods.name.toString()),
                        SizedBox(height: 4),
                        _buildFoodDescription(
                            foodDescription:
                                controller.foods.description.toString()),
                        SizedBox(height: 12),
                        CustomAboutRestaurant(
                          rate: '4.5',
                          isFree: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: CustomTopbar(
                title: "Details",
                actionIcon1: '',
                bgColor: Colors.transparent,
                cartNumber: '',
                actionIcon2: ''),
          ),
          Positioned(
            bottom: 110,
            left: 15,
            right: 15,
            child: _buildAddCart(),
          ),
          Positioned(
            bottom: 40,
            left: 15,
            right: 15,
            child: CustomButton(
              onTap: controller.addToCart,
              btntext: 'Add to cart',
              btnicon: '',
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddCart() {
    return Obx(
      () => Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${controller.total}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
                fontFamily: 'Sen',
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: controller.decrement,
                  child: Container(
                    height: 30,
                    width: 30,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Image.asset(
                      'assets/icons/Minus.png',
                      color: Colors.white,
                    )),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  controller.quantity.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                    fontFamily: 'Sen',
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: controller.increment,
                  child: Container(
                    height: 30,
                    width: 30,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Image.asset(
                      'assets/icons/Plus.png',
                      color: Colors.white,
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageRestaurant({required String img}) {
    return Obx(
      () => Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: controller.toggleFavorite,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.greyColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.isFavorite.value
                      ? Image.asset(
                          'assets/icons/favorite.png',
                          color: Colors.white,
                        )
                      : Image.asset(
                          'assets/icons/favorite (1).png',
                          color: Colors.white,
                        ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildFoodName({required String foodName}) {
    return Text(
      foodName,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
        fontFamily: 'Sen',
      ),
    );
  }

  Widget _buildFoodDescription({required String foodDescription}) {
    return Text(
      foodDescription,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
        fontFamily: 'Sen',
      ),
    );
  }
}
