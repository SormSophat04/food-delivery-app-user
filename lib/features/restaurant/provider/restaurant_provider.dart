import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:get/get.dart';

import '../model/food_model.dart';

class RestaurantProvider {
  final ApiProvider _apiProvider = Get.find();

  Future<List<FoodModel>> fetchFoods(
      {String? restaurantId, String? categoryId}) async {
    try {
      String endpoint = ApiEndpoint.foods;
      List<String> queryParams = [];
      if (restaurantId != null) {
        queryParams.add('restaurant_id=$restaurantId');
      }
      if (categoryId != null) {
        queryParams.add('category_id=$categoryId');
      }
      if (queryParams.isNotEmpty) {
        endpoint += '?' + queryParams.join('&');
      }

      final response = await _apiProvider.get(endpoint);
      if (response.data == null) {
        return [];
      }
      final List<dynamic> data = response.data;
      return data
          .map((item) => FoodModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
