import 'dart:developer';

import 'package:food_delivery_app/core/provider/api_provider.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:food_delivery_app/features/address/model/address_model.dart';

class AddressProvider {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<AddressModel>> getAddress() async {
    final response = await _apiProvider.get(ApiEndpoint.addrees);
    return response.data
        .map<AddressModel>((item) => AddressModel.fromJson(item))
        .toList();
  }

  Future<void> createAddress(AddressModel addresses) async {
    // log('POST ${ApiEndpoint.addrees} body: ${addresses.toCreateJson()}');
    await _apiProvider.post(
      ApiEndpoint.addrees,
      body: addresses.toCreateJson(),
    );
  }
}
