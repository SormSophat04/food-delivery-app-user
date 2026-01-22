import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/auth/view/login_view.dart';
import 'package:food_delivery_app/features/auth/view/signup_view.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({super.key});

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginView(onTap: toggleScreen);
    } else {
      return SignupView(onTap: toggleScreen);
    }
  }
}
