import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/restaurant/controller/food_controller.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_about_restaurant.dart';

class FoodDetailView extends GetView<FoodController> {
  final restaurant = Get.arguments;
  FoodDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
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
                        SizedBox(height: 120),
                        _buildImageRestaurant(restaurant.image ??
                            'assets/images/category_image.png'),
                        SizedBox(height: 24),
                        _buildNameRestaurant(),
                        SizedBox(height: 4),
                        _buildDescriptionRestaurant(),
                        SizedBox(height: 12),
                        CustomAboutRestaurant(
                          rate: '${restaurant.rating}',
                          isFree: restaurant.isOpen,
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
            bottom: 30,
            left: 15,
            right: 15,
            child: Obx(
              () => controller.quantity.value < 1
                  ? CustomButton(
                      btntext: 'Add to Cart',
                      btnicon: '',
                      onTap: controller.increment,
                    )
                  : _buildAddCart(),
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
              '\$${controller.totalPrice.toStringAsFixed(2)}',
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

  Widget _buildImageRestaurant(String img) {
    return Obx(
      () => Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage(img),
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

  Widget _buildNameRestaurant() {
    return Text(
      "pizza calzone european",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
        fontFamily: 'Sen',
      ),
    );
  }

  Widget _buildDescriptionRestaurant() {
    return Text(
      "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
        fontFamily: 'Sen',
      ),
    );
  }
}
