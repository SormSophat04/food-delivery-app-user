import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/payment/controller/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
