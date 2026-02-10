import 'package:food_delivery_app/features/order/controller/order_controller.dart';
import 'package:food_delivery_app/features/order/controller/order_item_controller.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<OrderItemController>(() => OrderItemController());
  }
}
