class CardModel {
  CardModel({
    this.id,
    required this.userId,
    required this.holderName,
    required this.cardNumber,
    required this.expireDate,
    required this.cvv,
  });

  final int? id;
  final String? userId;
  final String? holderName;
  final String? cardNumber;
  final String? expireDate;
  final int? cvv;

  CardModel copyWith({
    int? id,
    String? userId,
    String? holderName,
    String? cardNumber,
    String? expireDate,
    int? cvv,
  }) {
    return CardModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      holderName: holderName ?? this.holderName,
      cardNumber: cardNumber ?? this.cardNumber,
      expireDate: expireDate ?? this.expireDate,
      cvv: cvv ?? this.cvv,
    );
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json["id"],
      userId: json["user_id"],
      holderName: json["holder_name"],
      cardNumber: json["card_number"],
      expireDate: json["expire_date"],
      cvv: json["cvv"],
    );
  }

  Map<String, dynamic> toJson() => {
        // "id": id,
        "user_id": userId,
        "holder_name": holderName,
        "card_number": cardNumber,
        "expire_date": expireDate,
        "cvv": cvv,
      };
}
