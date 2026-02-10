import 'package:food_delivery_app/features/address/controller/address_controller.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/payment/controller/payment_controller.dart';
import 'package:food_delivery_app/features/payment/controller/payment_method_controller.dart';
import 'package:get/get.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AddressController>()) {
      Get.lazyPut<AddressController>(() => AddressController());
    }
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<PaymentController>(() => PaymentController());
    Get.lazyPut<PaymentMethodController>(() => PaymentMethodController());
  }
}
