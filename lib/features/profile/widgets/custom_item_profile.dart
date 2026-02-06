import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomItemProfile extends StatelessWidget {
  const CustomItemProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [CircleAvatar(radius: 20)],
      ),
    );
  }
}
