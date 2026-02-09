import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/cart/controller/cart_controller.dart';
import 'package:food_delivery_app/features/payment/controller/payment_controller.dart';
import 'package:get/get.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 120),
                    _buildText('Payment Method'),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        itemCount: 10,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => _buildPayment(
                            index, controller.selectedPaymentIndex.value),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildText('Address'),
                    SizedBox(height: 10),
                    Container(
                      height: 80,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildText('Item Details'),
                    SizedBox(height: 10),
                    GetBuilder<CartController>(
                      builder: (cartController) => ListView.builder(
                        itemCount: cartController.cartItemsWithFood.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) => Container(
                          height: 70,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 1,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      cartController
                                          .cartItemsWithFood[index].food.image
                                          .toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              _buildFoodNameAndPrice(cartController, index),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildText('Total'),
                    SizedBox(height: 200),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: CustomTopbar(
                title: 'Payment',
                actionIcon1: '',
                bgColor: Colors.transparent,
                cartNumber: '',
                actionIcon2: '',
              ),
            ),
            Positioned(
              bottom: 30,
              left: 16,
              right: 16,
              child: CustomButton(
                btntext: 'Pay Now',
                btnicon: '',
                isLoading: controller.isLoading.value,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodNameAndPrice(cartController, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cartController.cartItemsWithFood[index].food.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
            fontFamily: 'Sen',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
            '\$${cartController.cartItemsWithFood[index].food.price} X ${cartController.cartItemsWithFood[index].cartItem.quantity}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
              fontFamily: 'Sen',
            )),
      ],
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Sen',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColors.blackColor,
        ),
      ),
    );
  }

  Widget _buildPayment(index, isSelected) {
    return GestureDetector(
      onTap: () {
        Get.find<PaymentController>().selectPayment(index);
      },
      child: Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade100,
          borderRadius: BorderRadius.circular(10),
          border: index == isSelected
              ? Border.all(
                  width: 3,
                  color: AppColors.primaryColor,
                )
              : null,
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: isSelected == index
              ? Icon(Icons.check_circle_outline_rounded,
                  color: AppColors.primaryColor)
              : null,
        ),
      ),
    );
  }
}
