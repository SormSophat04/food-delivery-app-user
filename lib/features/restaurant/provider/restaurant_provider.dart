import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:food_delivery_app/features/home/model/category_model.dart';

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

  Future<Map<String, dynamic>> getFoodById(int foodId) async {
    final response = await _apiProvider.get('${ApiEndpoint.foods}/$foodId');
    return _unwrapSingleFood(response.data);
  }

  Map<String, dynamic> _unwrapSingleFood(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data')) {
        return _unwrapSingleFood(data['data']);
      }
      return data;
    }
    if (data is List) {
      if (data.isEmpty) {
        throw Exception('Food not found.');
      }
      return _unwrapSingleFood(data.first);
    }
    throw Exception('Unexpected food response: ${data.runtimeType}');
  }

  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiProvider.get(ApiEndpoint.categories);
    return response.data
        .map<CategoryModel>((item) => CategoryModel.fromJson(item))
        .toList();
  }
}
