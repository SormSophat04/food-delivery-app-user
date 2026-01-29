import 'package:food_delivery_app/features/home/model/category_model.dart';
import 'package:food_delivery_app/features/restaurant/provider/restaurant_provider.dart';
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

  final restaurant = Get.arguments;

  List<FoodModel> get filteredFoodList {
    return foodList;
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
    String? categoryId;
    if (index != 0) {
      categoryId = categoryList[index].id as String?;
    }
    fetchFoods(restaurantId: restaurant.id, categoryId: categoryId);
  }

  @override
  void onInit() {
    super.onInit();
    if (restaurant != null) {
      fetchFoods(restaurantId: restaurant.id);
    } else {
      fetchFoods();
    }
    print(errorMessage);
  }

  void fetchFoods({String? restaurantId, String? categoryId}) async {
    try {
      isLoading(true);
      final foods = await _restaurantProvider.fetchFoods(
          restaurantId: restaurantId, categoryId: categoryId);
      foodList.value = foods;
    } catch (e) {
      errorMessage.value = e.toString();
      print(errorMessage.value = e.toString());
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
