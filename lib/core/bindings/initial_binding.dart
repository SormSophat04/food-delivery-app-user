import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/home/controller/category_controller.dart';
import 'package:food_delivery_app/features/home/controller/restaurant_controller.dart';
import 'package:food_delivery_app/features/restaurant/controller/food_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(RestaurantController());
    Get.put(CategoryController());
    Get.put(FoodController());
    Get.lazyPut<ApiProvider>(() => ApiProvider());
  }
}
