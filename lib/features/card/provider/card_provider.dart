import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:food_delivery_app/features/card/model/card_model.dart';

class CardProvider {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<CardModel>> getCards() async {
    final response = await _apiProvider.get(ApiEndpoint.cards);
    List<dynamic> data = response.data;
    return data.map((item) => CardModel.fromJson(item)).toList();
  }

  Future<void> createCard(CardModel card) async {
    await _apiProvider.post(ApiEndpoint.cards, body: card.toJson());
  }

  Future<void> updateCard(CardModel card) async {
    await _apiProvider.put('${ApiEndpoint.cards}/${card.id}', body: card.toJson());
  }

  Future<void> deleteCard(int id) async {
    await _apiProvider.delete('${ApiEndpoint.cards}/$id');
  }
}
