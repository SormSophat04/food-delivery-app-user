class RestaurantModel {
  final int id;
  final String name;
  final String description;
  final String image;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        id: json['id'] as int,
        name: json['name']  as String,
        description: json['description'] as String,
        image: json['image'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
      };
}
