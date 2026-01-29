import 'package:food_delivery_app/features/home/controller/category_controller.dart';
import 'package:food_delivery_app/features/home/controller/restaurant_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => RestaurantController());
  }
}