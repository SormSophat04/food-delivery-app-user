import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_text_field.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/card/controller/card_controller.dart';
import 'package:get/get.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.only(left: 16, right: 16, top: 120),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(text: "CARD HOLDER NAME"),
                    SizedBox(height: 8),
                    CustomTextField(
                      obscureText: false,
                      hintText: 'justin bieber',
                      controller: controller.holderNameController,
                    ),
                    SizedBox(height: 24),
                    _buildText(text: "CARD NUMBER"),
                    SizedBox(height: 8),
                    CustomTextField(
                      obscureText: false,
                      hintText: '____ ____ ____ ____',
                      controller: controller.cardNumberController,
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _buildText(text: "EXPIRATION DATE"),
                              SizedBox(height: 8),
                              CustomTextField(
                                obscureText: false,
                                hintText: 'mm/yy',
                                controller: controller.expireDateController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              _buildText(text: "CVV"),
                              SizedBox(height: 8),
                              CustomTextField(
                                obscureText: false,
                                hintText: '***',
                                controller: controller.cvvController,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: CustomTopbar(
                title: 'Add Card',
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
                  btntext: 'ADD AND MAKE PAYMENT',
                  btnicon: '',
                  onTap: () => controller.createCard(),
                  isLoading: controller.isLoading.value,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Sen',
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
