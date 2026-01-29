class RestaurantModel {
  final int id;
  final String name;
  final String? description;
  final String? image;
  final double rating;
  final bool isOpen;

  RestaurantModel({
    required this.id,
    required this.name,
    this.description,
    this.image,
    required this.rating,
    required this.isOpen,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      rating: json['rating'].toDouble(),
      isOpen: json['is_open'] as bool,
    );
  }
}
