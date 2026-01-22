import 'package:food_delivery_app/features/auth/view/forgot_password_view.dart';
import 'package:food_delivery_app/features/auth/view/toggle_screen.dart';
import 'package:food_delivery_app/features/auth/view/verifycode_view.dart';
import 'package:food_delivery_app/features/bottom_nav_bar/custom_navbar.dart';
import 'package:food_delivery_app/features/cart/view/cart_view.dart';
import 'package:food_delivery_app/features/home/view/home_view.dart';
import 'package:food_delivery_app/features/onboarding/onboarding_view.dart';
import 'package:food_delivery_app/features/search/view/search_view.dart';
import 'package:food_delivery_app/features/splash/splash_view.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:get/get.dart';

class AppScreen {
  static final screens = [
    GetPage(name: AppRoute.splash, page: () => const SplashView()),
    GetPage(name: AppRoute.onBoarding, page: () => const OnboardingView()),
    GetPage(name: AppRoute.login, page: () => const ToggleScreen()),
    GetPage(
      name: AppRoute.forgotPassword,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(name: AppRoute.verifycode, page: () => const VerifycodeView()),
    GetPage(name: AppRoute.home, page: () => const HomeView()),
    GetPage(name: AppRoute.search, page: () => const SearchView()),
    GetPage(name: AppRoute.cart, page: () => const CartView()),
    GetPage(name: AppRoute.bottomnavbar, page: () => const CustomNavbar()),
  ];
}
