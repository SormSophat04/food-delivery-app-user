class OrderModel {
    OrderModel({
        required this.id,
        required this.userId,
        required this.restaurantId,
        required this.addressId,
        required this.totalPrice,
        required this.status,
        required this.createdAt,
    });

    final int? id;
    final String? userId;
    final int? restaurantId;
    final int? addressId;
    final int? totalPrice;
    final String? status;
    final DateTime? createdAt;

    OrderModel copyWith({
        int? id,
        String? userId,
        int? restaurantId,
        int? addressId,
        int? totalPrice,
        String? status,
        DateTime? createdAt,
    }) {
        return OrderModel(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            restaurantId: restaurantId ?? this.restaurantId,
            addressId: addressId ?? this.addressId,
            totalPrice: totalPrice ?? this.totalPrice,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
        );
    }

    factory OrderModel.fromJson(Map<String, dynamic> json){ 
        return OrderModel(
            id: json["id"],
            userId: json["user_id"],
            restaurantId: json["restaurant_id"],
            addressId: json["address_id"],
            totalPrice: json["total_price"],
            status: json["status"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "restaurant_id": restaurantId,
        "address_id": addressId,
        "total_price": totalPrice,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
    };

}
