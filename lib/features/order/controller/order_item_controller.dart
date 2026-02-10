import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_delivery_app/features/order/controller/order_controller.dart';
import 'package:food_delivery_app/features/order/model/order_item_model.dart';
import 'package:food_delivery_app/features/order/provider/order_item_provider.dart';
import 'package:food_delivery_app/features/restaurant/model/food_model.dart';
import 'package:food_delivery_app/features/restaurant/provider/restaurant_provider.dart';
import 'package:get/get.dart';

class OrderItemController extends GetxController {
  final OrderItemProvider _orderItemProvider = OrderItemProvider();
  final OrderController _orderController = Get.find<OrderController>();
  final RestaurantProvider _restaurantProvider = RestaurantProvider();
  var orderItems = <OrderItemModel>[].obs;
  var foodById = <int, FoodModel>{}.obs;
  var isLoading = false.obs;
  var isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(_orderController.orders, (_) => fetchOrderItems());
    ever(_orderController.selectedIndex, (_) => fetchOrderItems());
    fetchOrderItems();
  }

  Future<List<OrderItemModel>> fetchOrderItems() async {
    try {
      if (_orderController.orders.isEmpty) {
        orderItems.clear();
        foodById.clear();
        return orderItems;
      }
      final selectedIndex = _orderController.selectedIndex.value;
      if (selectedIndex < 0 || selectedIndex >= _orderController.orders.length) {
        orderItems.clear();
        foodById.clear();
        return orderItems;
      }
      final orderId = _orderController.orders[selectedIndex].id;
      if (orderId == null) {
        orderItems.clear();
        foodById.clear();
        return orderItems;
      }
      isLoading.value = true;
      final orderItemData =
          await _orderItemProvider.getOrderItems(orderId);
      orderItems.value = orderItemData;
      await _fetchFoodsForItems(orderItemData);
      return orderItems;
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map && data['message'] != null
          ? data['message'].toString()
          : (e.message ?? 'Unknown error');
      throw Exception('Error fetching order items: $message');
    } finally {
      update();
      isLoading.value = false;
    }
  }

  Future<void> _fetchFoodsForItems(List<OrderItemModel> items) async {
    if (items.isEmpty) {
      foodById.clear();
      return;
    }
    final futures = items.map((item) async {
      final foodId = item.foodId;
      if (foodId == null) return null;
      try {
        final foodData = await _restaurantProvider.getFoodById(foodId);
        return MapEntry(foodId, FoodModel.fromJson(foodData));
      } catch (e, stackTrace) {
        log('Error fetching food $foodId: $e', stackTrace: stackTrace);
        return null;
      }
    }).toList();

    final entries = await Future.wait(futures);
    final map = <int, FoodModel>{};
    for (final entry in entries) {
      if (entry != null) {
        map[entry.key] = entry.value;
      }
    }
    foodById.value = map;
  }
}
