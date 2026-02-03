import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: CustomTopbar(
                title: 'Burger',
                actionIcon1: '',
                bgColor: AppColors.greyBtn,
                cartNumber: '',
                actionIcon2: 'assets/icons/menu.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}
