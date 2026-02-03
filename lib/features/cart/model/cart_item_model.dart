class CartItemModel {
  CartItemModel({
    required this.id,
    required this.cartId,
    required this.foodId,
    required this.quantity,
  });

  final int? id;
  final int? cartId;
  final int? foodId;
  final int? quantity;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json["id"],
      cartId: json["cart_id"],
      foodId: json["food_id"],
      quantity: json["quantity"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "cart_id": cartId,
        "food_id": foodId,
        "quantity": quantity,
      };
}
