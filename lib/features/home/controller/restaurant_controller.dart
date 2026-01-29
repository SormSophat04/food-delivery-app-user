import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:get/get.dart';

import '../../../core/provider/api_provider.dart';
import '../model/restaurant_model.dart';

class RestaurantController extends GetxController {
  final ApiProvider _apiProvider = Get.find();
  var restaurantList = <RestaurantModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  void fetchRestaurants() async {
    try {
      isLoading(true);
      print('Fetching restaurants...');
      var response = await _apiProvider.get(ApiEndpoint.restaurants);
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        if (response.data is Map && response.data.containsKey('restaurants')) {
          restaurantList.value = (response.data['restaurants'] as List)
              .map((e) => RestaurantModel.fromJson(e))
              .toList();
        } else if (response.data is List) {
          restaurantList.value = (response.data as List)
              .map((e) => RestaurantModel.fromJson(e))
              .toList();
        } else {
            errorMessage.value = "Unexpected response format";
        }
      } else {
        errorMessage.value = response.statusMessage ?? 'Something went wrong';
      }
    } catch (e) {
      print('Error fetching restaurants: $e');
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
