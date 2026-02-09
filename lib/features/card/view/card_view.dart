import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/card/controller/card_controller.dart';
import 'package:get/get.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 120),
              child: ListView.builder(
                itemCount: controller.cards.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Container(
                  height: 80,
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    // color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.greyBtn),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildIcon(),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildText(
                            text: controller.cards[index].cardNumber.toString(),
                            size: 18,
                          ),
                          SizedBox(height: 8),
                          _buildText(
                            text:
                                'EXPIRATION DATE: ${controller.cards[index].expireDate}',
                            size: 10,
                          ),
                        ],
                      ),
                      Spacer(),
                      _buildAction(),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 10),
                      //   child: Column(
                      //     children: [
                      //       _buildAction(),
                      //     ],
                      //   ),
                      // )
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
                title: 'My Cards',
                actionIcon1: 'assets/icons/credit-card.png',
                onTapAction1: () => Get.toNamed(AppRoute.addPayment),
                bgColor: AppColors.greyBtn,
                cartNumber: '',
                actionIcon2: '',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction() {
    return Container(
      height: 30,
      width: 30,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        'assets/icons/delete.png',
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        'assets/icons/credit-card.png',
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget _buildText({required String text, required double size}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Sen',
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        fontSize: size,
      ),
    );
  }
}
