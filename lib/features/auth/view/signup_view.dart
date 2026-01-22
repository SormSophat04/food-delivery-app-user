import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  final Function()? onTap;
  const SignupView({super.key, this.onTap});

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
                    _name(),
                    CustomTextField(obscureText: false, hintText: 'ronaldo'),
                    SizedBox(height: 20),
                    _email(),
                    CustomTextField(
                      obscureText: false,
                      hintText: 'example@gmail.com',
                    ),
                    SizedBox(height: 20),
                    _password(),
                    CustomTextField(
                      obscureText: true,
                      hintText: '# # # # # # # # #',
                    ),
                    SizedBox(height: 20),
                    _confirmPassword(),
                    CustomTextField(
                      obscureText: true,
                      hintText: '# # # # # # # # #',
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      btntext: 'SIGN UP',
                      btnicon: '',
                      onTap: () => Get.toNamed('/verifycode'),
                    ),
                    SizedBox(height: 10),
                    _login(),
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
      'Sign Up',
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
      'Please sign up to get started',
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

  Widget _password() {
    return Text(
      'PASSWORD',
      style: TextStyle(
        fontSize: 13,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Sen',
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _name() {
    return Text(
      'NAME',
      style: TextStyle(
        fontSize: 13,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Sen',
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _confirmPassword() {
    return Text(
      'RE-ENTER PASSWORD',
      style: TextStyle(
        fontSize: 13,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Sen',
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _login() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w400,
            fontFamily: 'Sen',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'LOG IN',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
              fontFamily: 'Sen',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
