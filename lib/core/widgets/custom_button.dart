import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String btntext;
  final String btnicon;
  final Function()? onTap;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.btntext,
    required this.btnicon,
    this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor.withOpacity(isLoading ? 0.7 : 1.0),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.whiteColor,
                    strokeWidth: 3,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    btntext,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Sen',
                    ),
                  ),
                  if (btnicon.isNotEmpty) ...[
                    const SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(btnicon),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
      ),
    );
  }
}
