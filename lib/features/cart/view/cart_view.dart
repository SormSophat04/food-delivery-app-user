import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/cart/controller/cart_controller.dart';
import 'package:food_delivery_app/features/cart/widgets/custom_card.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: CustomCard(),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: CustomTopbar(
                title: 'Cart',
                actionIcon1: 'assets/icons/menu.png',
                bgColor: AppColors.greyBtn,
                cartNumber: '',
                actionIcon2: '',
              ),
            ),
            Positioned(
              bottom: 80,
              left: 15,
              right: 15,
              child: _buildCheckout(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCheckout() {
    return Container(
      height: 60.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(19)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total: \$${30}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
              fontFamily: 'Sen',
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: 'Sen',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
