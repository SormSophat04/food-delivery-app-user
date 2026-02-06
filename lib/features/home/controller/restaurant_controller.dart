import 'package:dio/dio.dart';
import 'package:food_delivery_app/features/home/model/category_model.dart';
import 'package:food_delivery_app/features/home/provider/home_provider.dart';
import 'package:get/get.dart';

import '../model/restaurant_model.dart';

class RestaurantController extends GetxController {
  final HomeProvider _homeProvider = HomeProvider();

  var restaurantList = <RestaurantModel>[].obs;
  var categoryList = <CategoryModel>[].obs;
  var categoryAll = <CategoryModel>[].obs;

  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchHomeData();
  }

  Future<void> _fetchHomeData() async {
    try {
      isLoading(true);
      final restaurants = await _homeProvider.fetchRestaurants();
      restaurantList.value = restaurants;

      final categories = await _homeProvider.fetchCategories();
      _applyCategories(categories);
    } on DioException catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void _applyCategories(List<CategoryModel> categories) {
    categoryAll.assignAll(categories);
    categoryList.assignAll([
      CategoryModel(
        id: 0,
        name: 'All',
        image: '',
        createdAt: DateTime.now().toString(),
      ),
      ...categories,
    ]);
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      final categories = await _homeProvider.fetchCategories();
      _applyCategories(categories);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> selectCategory(int index) async {
    selectedCategoryIndex.value = index;
  }

  Future<void> getCategory() async => fetchCategories();
}
