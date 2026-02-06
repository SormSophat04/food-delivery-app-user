import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/cart/model/cart_item_model.dart';
import 'package:food_delivery_app/features/cart/model/cart_item_with_food_model.dart';
import 'package:food_delivery_app/features/cart/model/cart_model.dart';
import 'package:food_delivery_app/features/cart/provider/cart_provider.dart';
import 'package:food_delivery_app/features/restaurant/model/food_model.dart';
import 'package:food_delivery_app/features/restaurant/provider/restaurant_provider.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartProvider _cartProvider = CartProvider();
  final AuthController _authController = Get.find<AuthController>();
  final RestaurantProvider _restaurantProvider = RestaurantProvider();
  var cart = <CartModel>[].obs;
  var cartItems = <CartItemModel>[].obs;
  var cartItemsWithFood = <CartItemWithFood>[].obs;
  var quantity = 1.obs;
  var totalAmount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  Future<void> getCartItems() async {
    try {
      final userId = _authController.userId.value;
      if (userId.isEmpty) {
        Get.snackbar('Error', 'Please login to see your cart.');
        return;
      }
      final cartId = await _cartProvider.getCartIdByUserId(userId);
      final items = await _cartProvider.getCartItems(cartId);
      log('Cart items: ${items.map((e) => e.toJson()).toList()}');
      cartItems.value = items;
      await processCartItems();
    } catch (e, stackTrace) {
      log('Error fetching cart items: $e', stackTrace: stackTrace);
      Get.snackbar('Error', 'Could not fetch cart items.');
    }
  }

  Future<void> processCartItems() async {
    var newCartItemsWithFood = <CartItemWithFood>[];
    double total = 0;
    for (var item in cartItems) {
      try {
        if (item.foodId != null) {
          final foodData = await _restaurantProvider.getFoodById(item.foodId!);
          final food = FoodModel.fromJson(foodData);
          newCartItemsWithFood
              .add(CartItemWithFood(cartItem: item, food: food));
          if (item.quantity != null) {
            total += food.price * item.quantity!;
          }
        }
      } catch (e) {
        log('Error processing cart item ${item.id}: $e');
      }
    }
    cartItemsWithFood.value = newCartItemsWithFood;
    totalAmount.value = total;
  }

  Future<void> removeCartItem(int cartItemId) async {
    try {
      final userId = _authController.userId.value;
      if (userId.isEmpty) {
        Get.snackbar('Error', 'Please login to edit your cart.');
        return;
      }
      final cartId = await _cartProvider.getCartIdByUserId(userId);
      await _cartProvider.removeCartItem(cartId, cartItemId);

      cartItems.removeWhere((item) => item.id == cartItemId);
      cartItemsWithFood
          .removeWhere((item) => item.cartItem.id == cartItemId);
      _recalculateTotal();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        Get.snackbar('Error', 'Cart item not found.');
      } else {
        Get.snackbar('Error', 'Failed to remove cart item.');
      }
    }
  }

  void _recalculateTotal() {
    double total = 0;
    for (final item in cartItemsWithFood) {
      final quantity = item.cartItem.quantity ?? 0;
      total += item.food.price * quantity;
    }
    totalAmount.value = total;
  }
}
