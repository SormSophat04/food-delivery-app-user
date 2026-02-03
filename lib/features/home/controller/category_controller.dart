import 'package:food_delivery_app/features/home/model/category_model.dart';
import 'package:food_delivery_app/features/home/provider/category_provider.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final CategoryProvider _categoryProvider = CategoryProvider();
  var categoryList = <CategoryModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryProvider.getCategory();
      return categories.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> selectCategory(int index) async {
    selectedCategoryIndex.value = index;
    await getCategory();
  }

  Future<void> getCategory() async {
    try {
      isLoading.value = true;
      final categories = await _categoryProvider.getCategory();
      categoryList.value =
          categories.map((e) => CategoryModel.fromJson(e)).toList();
      categoryList.insert(
        0,
        CategoryModel(
          id: 0,
          name: 'All',
          createdAt: DateTime.now().toString(),
        ),
      );
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
