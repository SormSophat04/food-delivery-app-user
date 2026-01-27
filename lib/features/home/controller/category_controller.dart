import 'package:food_delivery_app/features/home/model/category_model.dart';
import 'package:food_delivery_app/features/home/provider/home_provider.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final HomeProvider _homeProvider = HomeProvider();
  var categoryList = <CategoryModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      final categories = await _homeProvider.fetchCategories();
      categoryList.value = categories;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
