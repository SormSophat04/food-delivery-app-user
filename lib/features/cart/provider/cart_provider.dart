import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:food_delivery_app/features/cart/model/cart_item_model.dart';
import 'package:food_delivery_app/features/restaurant/model/food_model.dart';

class CartProvider {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<CartItemModel>> getCartItems(int cartId) async {
    final response =
        await _apiProvider.get('${ApiEndpoint.carts}/$cartId/items');
    return (response.data as List)
        .map((item) => CartItemModel.fromJson(item))
        .toList();
  }

  Future<List<FoodModel>> getFoodById(int foodId) async {
    final response = await _apiProvider.get('${ApiEndpoint.foods}/$foodId');
    return (response.data as List)
        .map((item) => FoodModel.fromJson(item))
        .toList();
  }

  Future<void> removeCartItem(int cartId, int cartItemId) async {
    await _apiProvider.delete('${ApiEndpoint.carts}/$cartId/items/$cartItemId');
  }

  Future<int> getCartIdByUserId(String userId) async {
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

  Future<void> getCartItemById(int cartId) async {
    await _apiProvider.get('${ApiEndpoint.cartItem}/$cartId/items');
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
