import 'package:food_delivery_app/features/address/controller/address_controller.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(() => AddressController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
