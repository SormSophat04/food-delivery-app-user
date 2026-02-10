class PaymentMethodModel {
  PaymentMethodModel({
    required this.id,
    required this.paymentName,
    required this.paymentImage,
    required this.createdAt,
  });

  final int? id;
  final String? paymentName;
  final String? paymentImage;
  final DateTime? createdAt;

  PaymentMethodModel copyWith({
    int? id,
    String? paymentName,
    String? paymentImage,
    DateTime? createdAt,
  }) {
    return PaymentMethodModel(
      id: id ?? this.id,
      paymentName: paymentName ?? this.paymentName,
      paymentImage: paymentImage ?? this.paymentImage,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json["id"],
      paymentName: json["payment_name"],
      paymentImage: json["payment_image"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_name": paymentName,
        "payment_image": paymentImage,
        "created_at": createdAt?.toIso8601String(),
      };
}
