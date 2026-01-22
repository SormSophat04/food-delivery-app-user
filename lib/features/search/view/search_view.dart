import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_topbar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          _searchBar(),
          SizedBox(height: 24),
          _txtPopular(),
        ],
      ),
    );
  }

  Widget _searchBar() {
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

  Widget _txtPopular() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Popular Burgers",
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
