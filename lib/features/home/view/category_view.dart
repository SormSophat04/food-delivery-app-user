import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/restaurant/controller/food_controller.dart';
import 'package:food_delivery_app/features/restaurant/widgets/custom_cate_card_selected.dart';
import 'package:get/get.dart';

class CategoryView extends GetView<FoodController> {
  final categoryGroup = Get.arguments;
  CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120),
                  _popularText(),
                  SizedBox(height: 24),
                  _buildGridFood(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: CustomTopbar(
              title: categoryGroup.name,
              actionIcon1: '',
              bgColor: AppColors.greyBtn,
              cartNumber: '',
              actionIcon2: 'assets/icons/menu.png',
            ),
          )
        ],
      ),
    );
  }

  Widget _popularText() {
    return Text(
      "Popular Dishes",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
        fontFamily: 'Sen',
      ),
    );
  }

  Widget _buildGridFood() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.value.isNotEmpty) {
        return Center(child: Text(controller.errorMessage.value));
      }

      if (controller.foodList.isEmpty) {
        return Center(child: Text('No foods found'));
      }

      return GridView.builder(
        itemCount: controller.foodList.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 100),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.82,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.toNamed(
            AppRoute.foodDetail,
            arguments: controller.foodList[index],
          ),
          child: CustomCateCardSelected(
            name: controller.foodList[index].name,
            foodimage: controller.foodList[index].image.toString(),
            foodPrice: controller.foodList[index].price.toString(),
            restauranName: controller.restaurant.name,
          ),
        ),
      );
    });
  }
}
