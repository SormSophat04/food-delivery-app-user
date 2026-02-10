import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/home/controller/restaurant_controller.dart';
import 'package:food_delivery_app/features/restaurant/controller/food_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantController>(() => RestaurantController());
    Get.lazyPut<FoodController>(() => FoodController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
