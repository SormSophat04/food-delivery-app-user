import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/features/cart/controller/cart_controller.dart';
import 'package:food_delivery_app/features/cart/model/cart_item_with_food_model.dart';
import 'package:get/get.dart';

class CustomCard extends GetView<CartController> {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.cartItemsWithFood.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding:
            EdgeInsets.only(top: 120.h, left: 16.w, right: 16.w, bottom: 140.h),
        itemBuilder: (context, index) {
          final cartItemWithFood = controller.cartItemsWithFood[index];
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.25,
              motion: ScrollMotion(),
              children: [_buildAction(cartItemWithFood.cartItem.id)],
            ),
            child: Container(
              height: 120.h,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 15.h),
              child: Row(
                children: [
                  _buildImage(cartItemWithFood.food.image),
                  SizedBox(width: 16.w),
                  _buildNameAndPrice(cartItemWithFood),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAction(int? cartItemId) {
    return GestureDetector(
      onTap: () {
        if (cartItemId == null) {
          Get.snackbar('Error', 'Cart item id is missing.');
          return;
        }
        controller.removeCartItem(cartItemId);
      },
      child: Container(
        height: double.infinity,
        width: 70.w,
        margin: EdgeInsets.only(left: 15.w, top: 5.w, bottom: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.primaryColor.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/icons/Cross.png',
            color: Colors.white,
            width: 40.w,
            height: 40.h,
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String? imageUrl) {
    return Container(
      height: 120.h,
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.greyColor,
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }

  Widget _buildNameAndPrice(CartItemWithFood cartItemWithFood) {
    return Container(
      height: 120.h,
      width: 205.w,
      // color: Colors.amber,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cartItemWithFood.food.name,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
              fontFamily: 'Sen',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '\$${cartItemWithFood.food.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
              fontFamily: 'Sen',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Size: M",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                  fontFamily: 'Sen',
                ),
              ),
              _buildQuantity(cartItemWithFood.cartItem.quantity ?? 0)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantity(int quantity) {
    return Row(
      children: [
        GestureDetector(
          // onTap: controller.decrement,
          child: Container(
            height: 25.h,
            width: 25.w,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
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
          quantity.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
            fontFamily: 'Sen',
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          // onTap: controller.increment,
          child: Container(
            height: 25.h,
            width: 25.w,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/Plus.png',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
