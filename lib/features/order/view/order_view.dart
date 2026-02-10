import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_cart_button.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/order/controller/order_item_controller.dart';
import 'package:food_delivery_app/features/order/model/order_item_model.dart';
import 'package:food_delivery_app/features/restaurant/model/food_model.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderItemController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(height: 400),
            ListView.builder(
              itemCount: controller.orderItems.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: 120,
                left: 15,
                right: 15,
                bottom: 100,
              ),
              itemBuilder: (context, index) {
                final item = controller.orderItems[index];
                final food = item.foodId != null
                    ? controller.foodById[item.foodId]
                    : null;
                return SizedBox(
                  height: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Food',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Sen',
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          _buildImage(food?.image),
                          SizedBox(width: 14),
                          Expanded(
                            child: _buildAboutFood(food: food, item: item),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      _buildButton(),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: CustomTopbar(
                title: 'My Orders',
                actionIcon1: 'assets/icons/menu.png',
                bgColor: AppColors.greyBtn,
                cartNumber: '',
                actionIcon2: '',
              ),
            ),
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     width: double.infinity,
            //     height: 100,
            //     color: Colors.amber,
            //     child: Row(
            //       children: [
            //         // Container(
            //         //   decoration: BoxDecoration(
            //         //     border: Border(
            //         //       bottom:
            //         //           BorderSide(color: AppColors.primaryColor, width: 2),
            //         //     ),
            //         //   ),
            //         //   child: Text('Ongoing'),
            //         // ),
            //         // Container(
            //         //   decoration: BoxDecoration(
            //         //     border: Border(
            //         //       bottom:
            //         //           BorderSide(color: AppColors.primaryColor, width: 2),
            //         //     ),
            //         //   ),
            //         //   child: Text('Ongoing'),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String? image) {
    final hasImage = image != null && image.isNotEmpty;
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
        image: hasImage ? DecorationImage(image: NetworkImage(image)) : null,
      ),
      child: hasImage
          ? null
          : Icon(
              Icons.fastfood,
              color: Colors.white,
              size: 28,
            ),
    );
  }

  Widget _buildAboutFood({
    required FoodModel? food,
    required OrderItemModel item,
  }) {
    final orderRef = item.orderId != null
        ? 'IN-${item.orderId}'
        : (item.id != null ? 'IN-${item.id}' : '');
    final price = item.price ?? food?.price;
    final quantity = item.quantity ?? 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                food?.name ?? 'Food',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sen',
                  color: AppColors.blackColor,
                ),
              ),
            ),
            if (orderRef.isNotEmpty) ...[
              SizedBox(width: 10),
              Text(
                orderRef,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sen',
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Text(
              price != null ? '\$${price.toStringAsFixed(2)}' : '--',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sen',
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '|',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sen',
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '${quantity.toString().padLeft(2, '0')} Items',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Sen',
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomCartButton(
              btntext: 'Track Order',
              btnicon: '',
            ),
          ),
          SizedBox(width: 70),
          Expanded(
              child: CustomCartButton(
            btntext: 'Cancel',
            btnicon: '',
            isBorder: true,
          ))
        ],
      ),
    );
  }
}
