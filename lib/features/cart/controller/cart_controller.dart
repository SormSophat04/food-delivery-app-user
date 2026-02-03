import 'dart:developer';

import 'package:food_delivery_app/features/cart/model/cart_item_model.dart';
import 'package:food_delivery_app/features/cart/model/cart_model.dart';
import 'package:food_delivery_app/features/cart/provider/cart_provider.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartProvider _cartProvider = CartProvider();
  var cart = <CartModel>[].obs;
  var cartItems = <CartItemModel>[].obs;
  var quantity = 1.obs;
  var totalAmount = 30.0.obs;

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void checkout() {
    // Logic for checkout process
    Get.toNamed('/payment');
  }

  void removeItem(int index) {
    // Logic to remove item from cart
  }

  Future<void> getCartItems() async {
    try {
      final data = await _cartProvider.getCartItems();
      cartItems.value =
          data.map((item) => CartItemModel.fromJson(item)).toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> getCart() async {
    try {
      final data = await _cartProvider.getCart();
      return data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
