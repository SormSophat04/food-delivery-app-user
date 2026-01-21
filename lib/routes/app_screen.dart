import 'package:food_delivery_app/features/presentation/auth/view/forgot_password_view.dart';
import 'package:food_delivery_app/features/presentation/auth/view/toggle_screen.dart';
import 'package:food_delivery_app/features/presentation/auth/view/verifycode_view.dart';
import 'package:food_delivery_app/features/presentation/home/view/home_view.dart';
import 'package:food_delivery_app/features/presentation/onboarding/onboarding_view.dart';
import 'package:food_delivery_app/features/splash/splash_view.dart';
import 'package:food_delivery_app/routes/app_route.dart';
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
  ];
}
