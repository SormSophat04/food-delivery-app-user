import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/card/controller/card_controller.dart';
import 'package:get/get.dart';

class CardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<CardController>(() => CardController());
  }
}
