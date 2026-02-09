import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/features/address/controller/address_controller.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/card/controller/card_controller.dart';
import 'package:food_delivery_app/features/cart/controller/cart_controller.dart';
import 'package:food_delivery_app/features/detail/controller/detail_controller.dart';
import 'package:food_delivery_app/features/home/controller/restaurant_controller.dart';
import 'package:food_delivery_app/features/restaurant/controller/food_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<RestaurantController>(() => RestaurantController());
    Get.lazyPut<FoodController>(() => FoodController());
    Get.lazyPut<DetailController>(() => DetailController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<AddressController>(() => AddressController());
    Get.lazyPut<CardController>(() => CardController());
  }
}
