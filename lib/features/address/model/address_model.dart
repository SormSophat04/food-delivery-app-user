class AddressModel {
  AddressModel({
    required this.id,
    required this.userId,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.place,
    required this.isDefault,
  });

  final int? id;
  final String? userId;
  final String? address;
  final double? latitude;
  final double? longitude;
  final DateTime? createdAt;
  final String? place;
  final bool? isDefault;

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json["id"],
      userId: json["user_id"],
      address: json["address"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      place: json["place"],
      isDefault: _toBool(json["is_default"]),
    );
  }

  Map<String, dynamic> toCreateJson() => _withoutNulls({
        "user_id": userId,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "place": place,
        "is_default": isDefault,
      });

  Map<String, dynamic> toJson() => _withoutNulls({
        "id": id,
        "user_id": userId,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt?.toIso8601String(),
        "place": place,
        "is_default": isDefault,
      });

  static Map<String, dynamic> _withoutNulls(Map<String, dynamic> map) {
    map.removeWhere((key, value) => value == null);
    return map;
  }

  static bool? _toBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      if (normalized == 'true' || normalized == '1') return true;
      if (normalized == 'false' || normalized == '0') return false;
    }
    return null;
  }
}
