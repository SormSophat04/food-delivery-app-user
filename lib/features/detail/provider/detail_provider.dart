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
    if (cartId == null) {
      throw Exception('Cart id not found in response.');
    }
    return cartId;
  }

  Future<void> addToCart({
    required int cartId,
    required int foodId,
    required int quantity,
  }) async {
    final endpoint =
        ApiEndpoint.cartItemId.replaceFirst('{id}', cartId.toString());
    await _apiProvider.post(
      endpoint,
      body: {
        'cart_id': cartId,
        'food_id': foodId,
        'quantity': quantity,
      },
    );
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
      }
    }
    return null;
  }
}
