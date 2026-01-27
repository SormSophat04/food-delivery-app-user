import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_about_restaurant.dart';
import 'package:food_delivery_app/features/home/controller/restaurant_controller.dart';
import 'package:get/get.dart';

class CustomRestaurantCard extends GetView<RestaurantController> {
  const CustomRestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.restaurantList.isEmpty) {
        return const Center(child: Text('No restaurants found.'));
      }
      return SizedBox(
        height: 250,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          itemCount: controller.restaurantList.length,
          itemBuilder: (context, index) {
            final restaurant = controller.restaurantList[index];
            return GestureDetector(
              onTap: () => Get.toNamed('/restaurant', arguments: restaurant),
              child: Container(
                height: 250,
                width: 300,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                // color: Colors.amber,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 205,
                        width: 250,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: AppColors.greyColor.withOpacity(0.2),
                                offset: const Offset(0, 8),
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _restaurantName(name: restaurant.name),
                            const SizedBox(height: 5),
                            _items(),
                            const SizedBox(height: 5),
                            const CustomAboutRestaurant(),
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
                          image: DecorationImage(
                            image: NetworkImage(restaurant.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _restaurantName({required String name}) {
    return Text(
      name,
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
}
