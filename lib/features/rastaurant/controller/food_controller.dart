import 'package:food_delivery_app/features/home/model/category_model.dart';
import 'package:food_delivery_app/features/rastaurant/provider/restaurant_provider.dart';
import 'package:get/get.dart';

import '../model/food_model.dart';

class FoodController extends GetxController {
  final RestaurantProvider _restaurantProvider = RestaurantProvider();
  var foodList = <FoodModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var quantity = 1.obs;
  var isFavorite = false.obs;
  final double price = 12.99;

  var categoryList = <CategoryModel>[].obs;
  var selectedCategoryIndex = 0.obs;

  List<FoodModel> get filteredFoodList {
    if (selectedCategoryIndex.value == 0) {
      return foodList;
    }
    return foodList
        .where((food) =>
            food.categoryId == categoryList[selectedCategoryIndex.value].id)
        .toList();
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchFoods();
  }

  void fetchFoods() async {
    try {
      isLoading(true);
      final foods = await _restaurantProvider.fetchFoods();
      foodList.value = foods;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  double get totalPrice => quantity.value * price;
}
