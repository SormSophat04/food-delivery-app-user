import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/address/controller/address_controller.dart';
import 'package:food_delivery_app/features/cart/controller/cart_controller.dart';
import 'package:food_delivery_app/features/payment/controller/payment_controller.dart';
import 'package:food_delivery_app/features/payment/controller/payment_method_controller.dart';
import 'package:food_delivery_app/features/payment/widgets/payment_skeleton.dart';
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
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: GetBuilder<CartController>(
                builder: (cartController) => SingleChildScrollView(
                  child: cartController.isLoading.value
                      ? const PaymentSkeleton()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 120),
                            _buildText('Payment Method'),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 80,
                              child: GetBuilder<PaymentMethodController>(
                                builder: (paymentMethodController) =>
                                    ListView.builder(
                                  itemCount: paymentMethodController
                                      .paymentMethods.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      _buildPayment(
                                          index,
                                          paymentMethodController
                                              .selectedPaymentIndex.value),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            _buildText('Address'),
                            SizedBox(height: 10),
                            GetBuilder<AddressController>(
                              builder: (addressController) {
                                final defaultAddress =
                                    addressController.defaultAddress.value;
                                final title = defaultAddress?.place ??
                                    'No default address';
                                final detail = defaultAddress?.address ??
                                    'Please add an address';
                                return Container(
                                  height: 80,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        title,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackColor,
                                          fontFamily: 'Sen',
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        detail,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                          fontFamily: 'Sen',
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 20),
                            _buildText('Item Details'),
                            SizedBox(height: 10),
                            ListView.builder(
                              itemCount:
                                  cartController.cartItemsWithFood.length,
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
                                        // border: Border.all(
                                        //   color: AppColors.primaryColor,
                                        //   width: 1,
                                        // ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            cartController
                                                .cartItemsWithFood[index]
                                                .food
                                                .image
                                                .toString(),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    _buildFoodNameAndPrice(
                                        cartController, index),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildText('Calculate'),
                            SizedBox(height: 10),
                            _buildCalculate(),
                            SizedBox(height: 200),
                          ],
                        ),
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
                isLoading: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculate() {
    return GetBuilder<CartController>(
      builder: (cartController) => Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                    fontFamily: 'Sen',
                  ),
                ),
                Text(
                  cartController.totalAmount.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontFamily: 'Sen',
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Fee',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                    fontFamily: 'Sen',
                  ),
                ),
                Text(
                  '\$${cartController.fee}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontFamily: 'Sen',
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                    fontFamily: 'Sen',
                  ),
                ),
                Text(
                  '\$${(cartController.totalAmount.value + cartController.fee.value).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontFamily: 'Sen',
                  ),
                ),
              ],
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
        SizedBox(height: 5),
        Text(
          '\$${cartController.cartItemsWithFood[index].food.price} X ${cartController.cartItemsWithFood[index].cartItem.quantity}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
            fontFamily: 'Sen',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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
        Get.find<PaymentMethodController>().selectPayment(index);
      },
      child: Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
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
