import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_about_restaurant.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/core/widgets/custom_category_bar.dart';
import 'package:food_delivery_app/features/rastaurant/controller/food_controller.dart';
import 'package:food_delivery_app/features/rastaurant/widgets/custom_cate_card_selected.dart';
import 'package:get/get.dart';

class RestaurantView extends GetView<FoodController> {
  final restaurant = Get.arguments;
  RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //About Restaurant
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 120),
                          _buildImageRestaurant(),
                          SizedBox(height: 24),
                          _buildNameRestaurant(name: restaurant.name),
                          SizedBox(height: 4),
                          _buildDescriptionRestaurant(
                            description: restaurant.description,
                          ),
                          SizedBox(height: 12),
                          CustomAboutRestaurant()
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    // Rastaurant Category
                    Obx(
                      () => CustomCategoryBar(
                        selectedIndex: controller.selectedCategoryIndex.value,
                        onCategorySelected: controller.selectCategory,
                      ),
                    ),
                    SizedBox(height: 24),

                    //Item Category
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // _buildCateNameSelected(),
                          SizedBox(
                            height: 20,
                          ),
                          // Obx(() => _buildGridCategoryCard()),
                          _buildGridCategoryCard(),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: CustomTopbar(
              title: 'Rastaurant View',
              actionIcon1: 'assets/icons/More.png',
              bgColor: AppColors.greyBtn,
              cartNumber: '',
              actionIcon2: '',
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGridCategoryCard() {
    return Obx(
      () => GridView.builder(
        itemCount: controller.filteredFoodList.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.83),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.toNamed('/foodDetail'),
          child: CustomCateCardSelected(
            name: controller.filteredFoodList[index].name,
            foodimage: controller.filteredFoodList[index].image,
          ),
        ),
      ),
    );
  }

  // Widget _buildCateNameSelected() {
  //   return Obx(
  //     () => Text(
  //       controller.categoryList[controller.selectedCategoryIndex.value].name,
  //       style: TextStyle(
  //         fontSize: 20,
  //         fontWeight: FontWeight.w400,
  //         color: AppColors.blackColor,
  //         fontFamily: 'Sen',
  //       ),
  //     ),
  //   );
  // }

  Widget _buildImageRestaurant() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(restaurant.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildNameRestaurant({required String name}) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
        fontFamily: 'Sen',
      ),
    );
  }

  Widget _buildDescriptionRestaurant({required String description}) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
        fontFamily: 'Sen',
      ),
    );
  }
}
