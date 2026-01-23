import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/features/cart/view/cart_view.dart';
import 'package:food_delivery_app/features/food/view/food_view.dart';
import 'package:food_delivery_app/features/home/view/home_view.dart';
import 'package:food_delivery_app/features/profile/view/profile_view.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

final List<Widget> _pages = [HomeView(), FoodView(), CartView(), ProfileView()];

class _CustomNavbarState extends State<CustomNavbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200, width: 1.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildNavButton(
                    0,
                    'assets/icons/home (4).png',
                    'assets/icons/home (5).png',
                  ),
                  _buildNavButton(
                    1,
                    'assets/icons/dashboards.png',
                    'assets/icons/dashboards (1).png',
                  ),
                  _buildNavButton(
                    2,
                    'assets/icons/shopping-bag (1).png',
                    'assets/icons/shopping-bag (2).png',
                  ),
                  _buildNavButton(
                    3,
                    'assets/icons/user (1).png',
                    'assets/icons/user.png',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(int index, String icon, String iconfill) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: SizedBox(
        height: 27,
        width: 27,
        child: Image.asset(
          _selectedIndex == index ? iconfill : icon,
          fit: BoxFit.cover,
          color: _selectedIndex == index
              ? AppColors.primaryColor
              : AppColors.greyColor,
        ),
      ),
    );
  }
}
