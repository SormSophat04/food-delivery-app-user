import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_text_field.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthController> {
  final Function()? onTap;
  LoginView({super.key, this.onTap});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  Future signIn() async {
    await controller.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          SizedBox(
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
                    _email(),
                    CustomTextField(
                      controller: _emailController,
                      obscureText: false,
                      hintText: 'example@gmail.com',
                    ),
                    SizedBox(height: 20),
                    _password(),
                    CustomTextField(
                      controller: _passwordController,
                      obscureText: true,
                      hintText: '# # # # # # # # #',
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [_rememberMe(), _forgotPassword()],
                    ),
                    SizedBox(height: 24),
                    CustomButton(
                      btntext: 'LOG IN',
                      btnicon: '',
                      onTap: () => signIn(),
                    ),
                    SizedBox(height: 24),
                    _singUp(),
                    SizedBox(height: 16),
                    _or(),
                    SizedBox(height: 16),
                    _loginWithOther(),
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
      'Log In',
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

  Widget _rememberMe() {
    return Row(
      children: [
        // Checkbox(
        //   value: true,
        //   onChanged: (value) {},
        //   activeColor: AppColors.primaryColor,

        // ),
        Text(
          'Remember Me',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w400,
            fontFamily: 'Sen',
          ),
        ),
      ],
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/forgotPassword');
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Sen',
        ),
      ),
    );
  }

  Widget _singUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
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
            'SING UP',
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

  Widget _or() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Or',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
            fontFamily: 'Sen',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _loginWithOther() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade200,
          ),
          child: Image.asset('assets/images/google.png'),
        ),
        SizedBox(width: 24),
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade100,
          ),
          child: Image.asset('assets/images/facebook.png'),
        ),
      ],
    );
  }
}
