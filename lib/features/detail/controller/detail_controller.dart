import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/detail/provider/detail_provider.dart';
import 'package:food_delivery_app/features/restaurant/model/food_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final DetailProvider _detailProvider = DetailProvider();
  final AuthController _authController = Get.find<AuthController>();
  var foodList = <FoodModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var quantity = 1.obs;
  var isFavorite = false.obs;
  var isAdding = false.obs;
  var addErrorMessage = ''.obs;

  final foods = Get.arguments;

  Future<void> addToCart() async {
    if (quantity.value < 1) {
      Get.snackbar('Invalid quantity', 'Please select at least 1 item.');
      return;
    }

    final userId = _authController.userId.value;
    if (userId.isEmpty) {
      Get.snackbar('Login required', 'Please login to add items to cart.');
      return;
    }

    try {
      isAdding.value = true;
      addErrorMessage.value = '';

      final cartId = await _detailProvider.createCart(userId: userId);

      await _detailProvider.addToCart(
        cartId: cartId,
        foodId: foods.id,
        quantity: quantity.value,
      );

      Get.snackbar('Success', 'Added to cart.');
    } catch (e) {
      addErrorMessage.value = e.toString();
      Get.snackbar('Add to cart failed', e.toString());
    } finally {
      isAdding.value = false;
    }
  }

  void increment() {
    quantity.value++;
  }

  num get total => quantity.value * foods.price;

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
