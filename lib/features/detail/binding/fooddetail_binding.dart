import 'package:food_delivery_app/features/rastaurant/controller/food_controller.dart';
import 'package:get/get.dart';

class FooddetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FoodController(),
    );
  }
}
