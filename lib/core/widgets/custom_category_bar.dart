import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/features/home/controller/category_controller.dart';
import 'package:get/get.dart';

class CustomCategoryBar extends GetView<CategoryController> {
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CustomCategoryBar({
    super.key,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryList.length,
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            return _buildCategory(index);
          },
        ),
      ),
    );
  }

  Widget _buildCategory(int index) {
    return GestureDetector(
      onTap: () => onCategorySelected(index),
      child: Container(
        height: 46,
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(33),
          color: selectedIndex == index
              ? AppColors.primaryColor
              : Colors.transparent,
        ),
        child: Center(
          child: Text(
            controller.categoryList[index].name ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color:
                  selectedIndex == index ? Colors.white : AppColors.blackColor,
              fontFamily: 'Sen',
            ),
          ),
        ),
      ),
    );
  }
}
