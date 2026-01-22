import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:get/get.dart';

class CustomTopbar extends StatelessWidget {
  final String title;
  final String actionIcon1;
  final String cartNumber;
  final Color bgColor;
  final String actionIcon2;
  const CustomTopbar({
    super.key,
    required this.title,
    required this.actionIcon1,
    required this.bgColor,
    required this.cartNumber,
    required this.actionIcon2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Row(
        children: [
          _backbtn(),
          SizedBox(width: 10),
          Expanded(child: _title()),
          _actionbtn1(),
          _actionbtn2(),
        ],
      ),
    );
  }

  Widget _actionbtn2() {
    return actionIcon2 == ''
        ? Container()
        : CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.greyBtn,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(actionIcon2),
            ),
          );
  }

  Widget _actionbtn1() {
    return actionIcon1 == ''
        ? Container()
        : Container(
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: bgColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      actionIcon1,
                      color: bgColor == AppColors.blackColor
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: cartNumber == ''
                      ? Container()
                      : Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              cartNumber,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          );
  }

  Widget _backbtn() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.greyBtn,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icons/back.png'),
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
        fontFamily: 'Sen',
      ),
    );
  }
}
