import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_category_card.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';
import 'package:food_delivery_app/features/search/widgets/custom_card_sugg.dart';
import 'package:food_delivery_app/core/widgets/custom_category_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            CustomTopbar(
              title: 'Search',
              actionIcon1: 'assets/icons/shopping-bag (1).png',
              actionIcon2: '',
              bgColor: AppColors.blackColor,
              cartNumber: '1',
            ),
            SizedBox(height: 24),
            _buildSearchBar(),
            SizedBox(height: 24),
            _buildRecenstText(),
            SizedBox(height: 12),
            CustomCategoryBar(
              selectedIndex: 2,
              onCategorySelected: (int p1) {},
            ),
            SizedBox(height: 24),
            _buildSuggestedText(),
            SizedBox(height: 12),
            CustomCardSugg(),
            SizedBox(height: 15),
            _buildPopularText(),
            SizedBox(height: 12),
            CustomCategoryCard(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/Search.png',
            width: 24,
            height: 24,
            color: Colors.grey,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: null,
              decoration: InputDecoration(
                hintText: "Search dishes, restaurants",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontFamily: 'Sen',
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecenstText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Recenst Keyboard",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
          fontFamily: 'Sen',
        ),
      ),
    );
  }

  Widget _buildSuggestedText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Suggested Restaurants",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
          fontFamily: 'Sen',
        ),
      ),
    );
  }

  Widget _buildPopularText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Popular Fast Food",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
          fontFamily: 'Sen',
        ),
      ),
    );
  }
}
