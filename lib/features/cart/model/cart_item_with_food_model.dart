import 'package:food_delivery_app/features/cart/model/cart_item_model.dart';
import 'package:food_delivery_app/features/restaurant/model/food_model.dart';

class CartItemWithFood {
  final CartItemModel cartItem;
  final FoodModel food;

  CartItemWithFood({required this.cartItem, required this.food});
}
