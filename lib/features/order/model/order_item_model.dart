class OrderItemModel {
  OrderItemModel({
    required this.id,
    required this.orderId,
    required this.foodId,
    required this.quantity,
    required this.price,
  });

  final int? id;
  final int? orderId;
  final int? foodId;
  final int? quantity;
  final double? price;

  OrderItemModel copyWith({
    int? id,
    int? orderId,
    int? foodId,
    int? quantity,
    double? price,
  }) {
    return OrderItemModel(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      foodId: foodId ?? this.foodId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json["id"],
      orderId: json["order_id"],
      foodId: json["food_id"],
      quantity: json["quantity"],
      price: _toDouble(json["price"]),
    );
  }

  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "food_id": foodId,
        "quantity": quantity,
        "price": price,
      };
}
