import 'dart:developer';

import 'package:food_delivery_app/core/widgets/success_dialog.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/cart/provider/cart_provider.dart';
import 'package:food_delivery_app/features/detail/provider/detail_provider.dart';
import 'package:food_delivery_app/features/restaurant/model/food_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final DetailProvider _detailProvider = DetailProvider();
  final CartProvider _cartProvider = CartProvider();
  final AuthController _authController = Get.find<AuthController>();
  var foodList = <FoodModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var quantity = 1.obs;
  var isFavorite = false.obs;
  var isAdding = false.obs;
  var addErrorMessage = ''.obs;

  final foods = Get.arguments;

  Future<void> addToCart() async {
    final userId = _authController.userId.value;
    try {
      isLoading.value = true;
      isAdding.value = true;
      addErrorMessage.value = '';

      final cartId = await _detailProvider.createCart(userId: userId);

      final items = await _cartProvider.getCartItems(cartId);
      final matchingItems =
          items.where((item) => item.foodId == foods.id).toList();

      String successMessage = 'Add to cart successfully';
      if (matchingItems.isNotEmpty) {
        int mergedQty = quantity.value;
        for (final item in matchingItems) {
          mergedQty += item.quantity ?? 0;
        }
        for (final item in matchingItems) {
          if (item.id != null) {
            await _cartProvider.removeCartItem(cartId, item.id!);
          }
        }
        await _detailProvider.addToCart(
          cartId: cartId,
          foodId: foods.id,
          quantity: mergedQty,
        );
        successMessage = 'Updated cart quantity';
      } else {
        await _detailProvider.addToCart(
          cartId: cartId,
          foodId: foods.id,
          quantity: quantity.value,
        );
      }

      Get.dialog(
        SuccessDialog(
          title: 'Success',
          message: successMessage,
          onPressed: () {
            Get.back();
            Get.back();
          },
        ),
      );
    } catch (e, stackTrace) {
      addErrorMessage.value = e.toString();
      Get.snackbar('Add to cart failed', e.toString());
      log('Error adding to cart: $e', stackTrace: stackTrace);
    } finally {
      isAdding.value = false;
      isLoading.value = false;
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
