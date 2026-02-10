import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final auth = Get.find<AuthController>();
    return auth.isLoggedIn.value ? null : RouteSettings(name: AppRoute.login);
  }
}
