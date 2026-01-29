import 'package:food_delivery_app/features/restaurant/controller/food_controller.dart';
import 'package:get/get.dart';

class FoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodController());
  }

}