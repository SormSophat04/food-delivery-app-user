import 'package:food_delivery_app/features/auth/view/auth_wrapper.dart';
import 'package:food_delivery_app/features/auth/view/forgot_password_view.dart';
import 'package:food_delivery_app/features/auth/view/toggle_screen.dart';
import 'package:food_delivery_app/features/auth/view/verifycode_view.dart';
import 'package:food_delivery_app/features/bottom_nav_bar/custom_navbar.dart';
import 'package:food_delivery_app/features/cart/view/cart_view.dart';
import 'package:food_delivery_app/features/detail/binding/fooddetail_binding.dart';
import 'package:food_delivery_app/features/detail/view/food_detail_view.dart';
import 'package:food_delivery_app/features/home/view/home_view.dart';
import 'package:food_delivery_app/features/onboarding/onboarding_view.dart';
import 'package:food_delivery_app/features/profile/view/profile_view.dart';
import 'package:food_delivery_app/features/rastaurant/binding/food_binding.dart';
import 'package:food_delivery_app/features/rastaurant/view/restaurant_view.dart';
import 'package:food_delivery_app/features/search/view/search_view.dart';
import 'package:food_delivery_app/features/splash/splash_view.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:get/get.dart';

import '../../features/home/binding/home_binding.dart';

class AppScreen {
  static final screens = [
    GetPage(name: AppRoute.splash, page: () => const SplashView()),
    GetPage(name: AppRoute.onBoarding, page: () => OnboardingView()),
    GetPage(name: AppRoute.login, page: () => const ToggleScreen()),
    GetPage(
      name: AppRoute.forgotPassword,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(name: AppRoute.verifycode, page: () => const VerifycodeView()),
    GetPage(
        name: AppRoute.home,
        page: () => HomeView(),
        binding: HomeBinding()),
    GetPage(name: AppRoute.search, page: () => const SearchView()),
    GetPage(name: AppRoute.cart, page: () => const CartView()),
    GetPage(name: AppRoute.bottomnavbar, page: () => const CustomNavbar()),
    GetPage(
      name: AppRoute.authWapper,
      page: () => const AuthWrapper(),
    ),
    GetPage(name: AppRoute.profile, page: () => const ProfileView()),
    GetPage(
        name: AppRoute.restaurant,
        page: () => RestaurantView(),
        binding: FoodBinding()),
    GetPage(
      name: AppRoute.foodDetail,
      page: () => FoodDetailView(),
      binding: FooddetailBinding(),
    ),
  ];
}
