import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;
  const CustomSearch({super.key, this.controller, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            Text(
              "Search dishes, restaurants",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                fontFamily: 'Sen',
              ),
            ),
            // Expanded(
            //   child: TextField(
            //     controller: controller,
            //     decoration: InputDecoration(
            //       hintText: "Search dishes, restaurants",
            //       hintStyle: TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.w400,
            //         color: Colors.grey,
            //         fontFamily: 'Sen',
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
