class CategoryModel {
    CategoryModel({
        required this.id,
        required this.name,
        required this.createdAt,
    });

    final int? id;
    final String? name;
    final String? createdAt;

    factory CategoryModel.fromJson(Map<String, dynamic> json){ 
        return CategoryModel(
            id: json["id"] as int,
            name: json["name"] as String,
            createdAt: json["created_at"] as String,
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
    };
}
