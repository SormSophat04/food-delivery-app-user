class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.role,
    required this.createdAt,
  });

  final String? id;
  final String? name;
  final String? phone;
  final String? role;
  final DateTime? createdAt;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      role: json["role"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
      };
}
