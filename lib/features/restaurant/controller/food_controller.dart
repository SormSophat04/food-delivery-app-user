import 'package:food_delivery_app/features/home/controller/restaurant_controller.dart';
import 'package:food_delivery_app/features/home/model/category_model.dart';
import 'package:food_delivery_app/features/restaurant/provider/restaurant_provider.dart';
import 'package:get/get.dart';

import '../model/food_model.dart';

class FoodController extends GetxController {
  final RestaurantProvider _restaurantProvider = RestaurantProvider();
  final RestaurantController _restaurantController =
      Get.find<RestaurantController>();
  RxList<CategoryModel> get categoryList => _restaurantController.categoryList;

  var foodList = <FoodModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var selectedCategoryIndex = 0.obs;
  final restaurant = Get.arguments;

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
    if (index == 0) {
      getFoodAll(restaurant.id);
    } else {
      if (index < _restaurantController.categoryList.length) {
        final categoryId = _restaurantController.categoryList[index].id;
        if (categoryId != null) {
          getFoodByRestaurantIdAndCategoryId(restaurant.id, categoryId);
        }
      } else {
        print("Error: Selected category index is out of bounds.");
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    getFoodAll(restaurant.id);
  }

  Future<void> updateSelectCategory(int index) async {
    selectedCategoryIndex.value = index;
    if (index == 0) {
      getFoodAll(restaurant.id);
    } else {
      getFoodByRestaurantIdAndCategoryId(restaurant.id, index);
    }
  }

  Future<void> getFoodAll(int restaurantId) async {
    try {
      isLoading.value = true;
      final data =
          await _restaurantProvider.getFoodAllByRestaurantId(restaurantId);
      foodList.value = data.map((e) => FoodModel.fromJson(e)).toList();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getFoodByRestaurantIdAndCategoryId(
      int restaurantId, int categoryId) async {
    try {
      final data = await _restaurantProvider.getFoodByRestaurantIdAndCategoryId(
          restaurantId, categoryId);
      foodList.value = data.map((item) => FoodModel.fromJson(item)).toList();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
