import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';

class DetailProvider {
  final ApiProvider _apiProvider = ApiProvider();

  Future<int> createCart({required String userId}) async {
    final response = await _apiProvider.post(
      ApiEndpoint.carts,
      body: {'user_id': userId},
    );
    final cartId = _extractCartId(response.data);
    if (cartId != null) {
      return cartId;
    }
    return await _fetchCartIdByUserId(userId);
  }

  Future<void> addToCart({
    required int cartId,
    required int foodId,
    required int quantity,
  }) async {
    await _apiProvider.post(
      ApiEndpoint.cartItem,
      body: {
        'cart_id': cartId,
        'food_id': foodId,
        'quantity': quantity,
      },
    );
  }

  Future<int> _fetchCartIdByUserId(String userId) async {
    final response = await _apiProvider.get(
      ApiEndpoint.carts,
      queryParameters: {'user_id': userId},
    );
    final cartId = _extractCartId(response.data);
    if (cartId == null) {
      throw Exception('Cart id not found for user.');
    }
    return cartId;
  }

  int? _extractCartId(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data['id'] != null) {
        return int.tryParse(data['id'].toString());
      }
      if (data['cart_id'] != null) {
        return int.tryParse(data['cart_id'].toString());
      }
      final inner = data['data'];
      if (inner is Map<String, dynamic>) {
        if (inner['id'] != null) {
          return int.tryParse(inner['id'].toString());
        }
        if (inner['cart_id'] != null) {
          return int.tryParse(inner['cart_id'].toString());
        }
      } else if (inner is List) {
        for (final item in inner) {
          final id = _extractCartId(item);
          if (id != null) return id;
        }
      }
    } else if (data is List) {
      for (final item in data) {
        final id = _extractCartId(item);
        if (id != null) return id;
      }
    }
    return null;
  }
}
