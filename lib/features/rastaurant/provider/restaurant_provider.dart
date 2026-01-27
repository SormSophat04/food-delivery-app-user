import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:get/get.dart';

import '../model/food_model.dart';

class RestaurantProvider {
  final ApiProvider _apiProvider = Get.find();

  Future<List<FoodModel>> fetchFoods() async {
    try {
      final response = await _apiProvider.get(ApiEndpoint.foods);
      final List<FoodModel> data = response.data;
      return data.map((item) => FoodModel.fromJson(item as Map<String, dynamic>)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
