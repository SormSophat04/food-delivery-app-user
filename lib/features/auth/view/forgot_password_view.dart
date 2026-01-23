import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Container(
            height: 240,
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(height: 100, width: double.infinity),
                      _title(),
                      SizedBox(height: 3),
                      _subtitle(),
                    ],
                  ),
                ),
                Positioned(
                  top: -160,
                  left: -160,
                  child: Image.asset(
                    'assets/images/Ellipse 1005.png',
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    _email(),
                    CustomTextField(
                      obscureText: false,
                      hintText: 'example@gmail.com',
                    ),
                    SizedBox(height: 60),
                    _button(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      'Forgot Password',
      style: TextStyle(
        fontSize: 30,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Sen',
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _subtitle() {
    return Text(
      'Please sign in to your existing account',
      style: TextStyle(
        fontSize: 16,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Sen',
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _email() {
    return Text(
      'EMAIL',
      style: TextStyle(
        fontSize: 13,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Sen',
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _button() {
    return Column(
      children: [
        CustomButton(
          btntext: 'SEND CODE',
          btnicon: '',
          onTap: () => Get.toNamed('/verifycode'),
        ),
        SizedBox(height: 6),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Back to Login",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w400,
              fontFamily: 'Sen',
            ),
          ),
        ),
      ],
    );
  }
}
