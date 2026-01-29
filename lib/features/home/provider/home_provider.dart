import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:food_delivery_app/features/home/model/category_model.dart';
import 'package:food_delivery_app/features/home/model/restaurant_model.dart';
import 'package:get/get.dart';

class HomeProvider {
  final ApiProvider _apiProvider = Get.find();

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await _apiProvider.get(ApiEndpoint.categories);
      final List<dynamic> data = response.data;
      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } catch (e) {
      print(e);
        rethrow;
    }
  }
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