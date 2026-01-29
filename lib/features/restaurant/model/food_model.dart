class FoodModel {
  final int id;
  final int restaurantId;
  final int categoryId;
  final String name;
  final String description;
  final double price;
  final String? image;
  final bool isAvailable;

  FoodModel({
    required this.id,
    required this.restaurantId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    this.image,
    required this.isAvailable,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'] as int,
      restaurantId: json['restaurant_id'] as int,
      categoryId: json['category_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String?,
      isAvailable: json['is_available'] as bool,
    );
  }
}
