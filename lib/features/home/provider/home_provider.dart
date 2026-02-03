import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:food_delivery_app/features/home/model/restaurant_model.dart';

class HomeProvider {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<RestaurantModel>> fetchRestaurants() async {
    try {
      final response = await _apiProvider.get(ApiEndpoint.restaurants);
      final List<dynamic> data = response.data;
      return data.map((item) => RestaurantModel.fromJson(item)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
