import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/address/controller/address_controller.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: controller.address.length,
                padding: EdgeInsets.only(top: 100),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildIcon(),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildTitleAndAction(controller, index),
                              _buildAddressText(controller, index),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: CustomTopbar(
                title: 'My Address',
                actionIcon1: '',
                bgColor: Colors.transparent,
                cartNumber: '',
                actionIcon2: '',
              ),
            ),
            Positioned(
              bottom: 40,
              left: 16,
              right: 16,
              child: Obx(
                () => CustomButton(
                  btntext: 'Add New Address',
                  btnicon: '',
                  onTap: () => Get.toNamed(AppRoute.newAddress),
                  isLoading: false,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // IconData _getIconForCategory(String? categoryName) {
  //   switch (categoryName?.toLowerCase()) {
  //     case 'pizza':
  //       return Icons.local_pizza;
  //     case 'sushi':
  //       return Icons.ramen_dining;
  //     case 'burger':
  //       return Icons.eco;
  //     case 'drink':
  //       return Icons.fastfood;
  //     default:
  //       return Icons.restaurant;
  //   }
  // }

  // Color _getColorForCategory(String? categoryName) {
  //   switch (categoryName?.toLowerCase()) {
  //     case 'drink':
  //       return Colors.green;
  //     case 'pizza':
  //       return Colors.red;
  //     case 'burger':
  //       return Colors.brown;
  //     case 'sushi':
  //       return Colors.blue;
  //     default:
  //       return Colors.orange;
  //   }
  // }

  Widget _buildAddressText(controller, index) {
    return Text(
      controller.address[index].address,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
        fontFamily: 'Sen',
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTitleAndAction(controller, index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          controller.address[index].place,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Sen',
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
        ),
        Row(
          children: [
            Image.asset(
              'assets/icons/compose.png',
              width: 18,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 10),
            Image.asset(
              'assets/icons/delete.png',
              width: 18,
              color: AppColors.primaryColor,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildIcon() {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.white,
      child: Image.asset(
        'assets/icons/home (4).png',
        width: 26,
      ),
    );
  }
}
