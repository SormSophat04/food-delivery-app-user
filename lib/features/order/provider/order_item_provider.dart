import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:food_delivery_app/features/order/model/order_item_model.dart';
import 'package:dio/dio.dart';

class OrderItemProvider {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<OrderItemModel>> getOrderItems(int orderId) async {
    try {
      return await _fetchByEndpoint(ApiEndpoint.orderItem, orderId);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return await _fetchByEndpoint(ApiEndpoint.orderItemCamel, orderId);
      }
      rethrow;
    }
  }

  Future<List<OrderItemModel>> _fetchByEndpoint(
    String endpoint,
    int orderId,
  ) async {
    final response = await _apiProvider.get(
      endpoint,
      queryParameters: {'order_id': orderId},
    );
    final orderItems = _unwrapList(response.data);
    return orderItems.map((e) => OrderItemModel.fromJson(e)).toList();
  }

  List<dynamic> _unwrapList(dynamic data) {
    if (data is List) {
      return data;
    }
    if (data is Map<String, dynamic>) {
      final innerData = data['data'];
      if (innerData is List) {
        return innerData;
      }
      final items = data['items'];
      if (items is List) {
        return items;
      }
    }
    throw Exception('Unexpected order items response: ${data.runtimeType}');
  }
}
