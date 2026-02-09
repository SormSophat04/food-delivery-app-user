import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/detail/controller/detail_controller.dart';
import 'package:food_delivery_app/features/restaurant/controller/food_controller.dart';
import 'package:get/get.dart';

class FooddetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodController>(() => FoodController());
    Get.lazyPut<DetailController>(() => DetailController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
