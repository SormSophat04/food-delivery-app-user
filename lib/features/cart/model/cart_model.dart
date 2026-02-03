class CartModel {
    CartModel({
        required this.id,
        required this.userId,
        required this.createdAt,
    });

    final int? id;
    final String? userId;
    final DateTime? createdAt;

    factory CartModel.fromJson(Map<String, dynamic> json){ 
        return CartModel(
            id: json["id"],
            userId: json["user_id"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
    };

}
