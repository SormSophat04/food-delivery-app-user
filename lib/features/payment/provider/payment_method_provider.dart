import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:food_delivery_app/features/payment/model/payment_method_model.dart';

class PaymentMethodProvider {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    final response = await _apiProvider.get(ApiEndpoint.paymentMethods);
    return response.data
        .map<PaymentMethodModel>((item) => PaymentMethodModel.fromJson(item))
        .toList();
  }
}
