import 'package:dio/dio.dart';
import 'package:food_delivery_app/features/order/model/order_model.dart';
import 'package:food_delivery_app/features/order/provider/order_provider.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderProvider _orderProvider = OrderProvider();
  var orders = <OrderModel>[].obs;
  var isLoading = false.obs;
  var selectedIndex = 0.obs;
  var isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<List<OrderModel>> fetchOrders() async {
    try {
      isLoading.value = true;
      final orderData = await _orderProvider.getOrders();
      return orders.value = orderData;
    } on DioException catch (e) {
      throw Exception('Error fetching orders: ${e.response?.data['message']}');
    } finally {
      update();
      isLoading.value = false;
    }
  }
}
