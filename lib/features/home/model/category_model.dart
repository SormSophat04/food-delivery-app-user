class CategoryModel {
    CategoryModel({
        required this.id,
        required this.name,
        required this.image,
        required this.createdAt,
    });

    final int? id;
    final String? name;
    final String? image;
    final String? createdAt;

    factory CategoryModel.fromJson(Map<String, dynamic> json){ 
        return CategoryModel(
            id: json["id"] as int,
            name: json["name"] as String,
            image: json["image"] as String,
            createdAt: json["created_at"] as String,
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created_at": createdAt,
    };
}
