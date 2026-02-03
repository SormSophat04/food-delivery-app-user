import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';

class CartProvider {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List> getCartItems() async {
    final response = await _apiProvider.get(ApiEndpoint.cartItem);
    List<dynamic> data = response.data;
    return data;
  }

  Future<void> getCart() async {
    await _apiProvider.get(ApiEndpoint.cart);
  }
}
