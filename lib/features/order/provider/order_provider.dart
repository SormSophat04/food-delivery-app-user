import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:food_delivery_app/features/order/model/order_model.dart';

class OrderProvider {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<OrderModel>> getOrders() async {
    final response = await _apiProvider.get(ApiEndpoint.orders);
    List<dynamic> orders = response.data;
    return orders.map((e) => OrderModel.fromJson(e)).toList();
  }

  Future<void> createOrder(OrderModel order) async {
    await _apiProvider.post(ApiEndpoint.orders, body: order.toJson());
  }

  Future<void> updateOrder(OrderModel order) async {
    await _apiProvider.put(ApiEndpoint.orders, body: order.toJson());
  }

  Future<void> deleteOrder(int id) async {
    await _apiProvider.delete(
      '${ApiEndpoint.orders}/$id',
    );
  }
}
