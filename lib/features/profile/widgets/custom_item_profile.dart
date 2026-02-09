import 'package:flutter/material.dart';

class CustomItemProfile extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  final VoidCallback onTap;
  const CustomItemProfile({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        // color: Colors.amber,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Image.asset(
                icon,
                width: 22,
                color: color,
              ),
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'Sen',
              ),
            ),
            Spacer(),
            Image.asset(
              'assets/icons/arrow_right.png',
              height: 16,
              width: 16,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
