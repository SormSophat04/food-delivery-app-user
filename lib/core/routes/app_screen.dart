import 'package:food_delivery_app/core/bindings/initial_binding.dart';
import 'package:food_delivery_app/core/middleware/auth_guard.dart';
import 'package:food_delivery_app/features/address/binding/address_binding.dart';
import 'package:food_delivery_app/features/address/view/address_view.dart';
import 'package:food_delivery_app/features/address/view/new_address_view.dart';
import 'package:food_delivery_app/features/auth/binding/auth_binding.dart';
import 'package:food_delivery_app/features/auth/view/forgot_password_view.dart';
import 'package:food_delivery_app/features/auth/view/toggle_screen.dart';
import 'package:food_delivery_app/features/auth/view/verifycode_view.dart';
import 'package:food_delivery_app/core/widgets/custom_navbar.dart';
import 'package:food_delivery_app/features/card/binding/card_binding.dart';
import 'package:food_delivery_app/features/card/view/card_view.dart';
import 'package:food_delivery_app/features/cart/binding/cart_binding.dart';
import 'package:food_delivery_app/features/cart/view/cart_view.dart';
import 'package:food_delivery_app/features/detail/binding/fooddetail_binding.dart';
import 'package:food_delivery_app/features/detail/view/food_detail_view.dart';
import 'package:food_delivery_app/features/home/binding/home_binding.dart';
import 'package:food_delivery_app/features/home/view/category_view.dart';
import 'package:food_delivery_app/features/home/view/home_view.dart';
import 'package:food_delivery_app/features/onboarding/onboarding_view.dart';
import 'package:food_delivery_app/features/payment/binding/payment_binding.dart';
import 'package:food_delivery_app/features/card/view/add_card_view.dart';
import 'package:food_delivery_app/features/payment/view/payment_view.dart';
import 'package:food_delivery_app/features/profile/view/personal_info_view.dart';
import 'package:food_delivery_app/features/profile/view/profile_view.dart';
import 'package:food_delivery_app/features/restaurant/binding/food_binding.dart';
import 'package:food_delivery_app/features/restaurant/view/restaurant_view.dart';
import 'package:food_delivery_app/features/search/view/search_view.dart';
import 'package:food_delivery_app/features/splash/splash_view.dart';
import 'package:food_delivery_app/core/routes/app_route.dart';
import 'package:get/get.dart';

class AppScreen {
  static final screens = [
    GetPage(
      name: AppRoute.bottomnavbar,
      page: () => const CustomNavbar(),
      binding: InitialBinding(),
      middlewares: [AuthGuard()],
    ),
    GetPage(
      name: AppRoute.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: AppRoute.onBoarding,
      page: () => OnboardingView(),
    ),
    GetPage(
      name: AppRoute.login,
      page: () => const ToggleScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoute.forgotPassword,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(
      name: AppRoute.verifycode,
      page: () => const VerifycodeView(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoute.search,
      page: () => const SearchView(),
    ),
    GetPage(
      name: AppRoute.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoute.payment,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: AppRoute.card,
      page: () => CardView(),
      binding: CardBinding(),
    ),
    GetPage(
      name: AppRoute.addPayment,
      page: () => AddCardView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: AppRoute.profile,
      page: () => const ProfileView(),
    ),
    GetPage(
      name: AppRoute.personalInfo,
      page: () => PersonalInfoView(),
    ),
    GetPage(
        name: AppRoute.restaurant,
        page: () => RestaurantView(),
        binding: FoodBinding()),
    GetPage(
      name: AppRoute.foodDetail,
      page: () => FoodDetailView(),
      binding: FooddetailBinding(),
    ),
    GetPage(
      name: AppRoute.categoryGroup,
      page: () => CategoryView(),
      binding: FoodBinding(),
    ),
    GetPage(
      name: AppRoute.address,
      page: () => const AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: AppRoute.newAddress,
      page: () => NewAddressView(),
    )
  ];
}
