import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';

class RestaurantProvider {
  final ApiProvider _apiProvider = ApiProvider();
  var endpoint = ApiEndpoint.foods;

  Future<List> getFoodAllByRestaurantId(int restaurantId) async {
    final response = await _apiProvider.get(
      '$endpoint?restaurant_id=$restaurantId',
    );
    List<dynamic> data = response.data;
    return data;
  }

  Future<List> getFoodByRestaurantIdAndCategoryId(
      int restaurantId, int categoryId) async {
    final response = await _apiProvider.get(
      '$endpoint?restaurant_id=$restaurantId&category_id=$categoryId',
    );
    List<dynamic> data = response.data;
    return data;
  }
}
