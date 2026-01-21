import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String btntext;
  final String btnicon;
  final Function()? onTap;
  const CustomButton({
    super.key,
    required this.btntext,
    required this.btnicon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              btntext,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
                fontFamily: 'Sen',
              ),
            ),
            SizedBox(width: btnicon == '' ? 0 : 10),
            Container(
              height: btnicon == '' ? 0 : 20,
              width: btnicon == '' ? 0 : 20,
              decoration: btnicon == ''
                  ? null
                  : BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(btnicon),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
