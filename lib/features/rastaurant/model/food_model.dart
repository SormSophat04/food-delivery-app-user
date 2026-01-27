class FoodModel {
  final int id;
  final int restaurantId;
  final int categoryId;
  final String name;
  final double price;
  final String description;
  final String image;
  final List<int> ingredientIds;

  FoodModel({
    required this.id,
    required this.restaurantId,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.ingredientIds,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json['id'] as int,
        restaurantId: json['restaurant_id'] as int,
        categoryId: json['category_id'] as int,
        name: json['name'] as String,
        price: json['price'] as double,
        description: json['description'] as String,
        image: json['image'] as String,
        ingredientIds: List<int>.from(json['ingredient_ids'] as List<int>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'restaurant_id': restaurantId,
        'category_id': categoryId,
        'name': name,
        'price': price,
        'description': description,
        'image': image,
        'ingredient_ids': ingredientIds,
      };
}
