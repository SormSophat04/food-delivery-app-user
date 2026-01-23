import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/auth/view/toggle_screen.dart';
import 'package:food_delivery_app/features/home/view/home_view.dart';
import 'package:get/get.dart';

class AuthWrapper extends GetView<AuthController> {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user.value == null) {
        return ToggleScreen();
      } else {
        return HomeView();
      }
    });
  }
}
