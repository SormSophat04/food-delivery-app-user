import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/widgets/success_dialog.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:food_delivery_app/features/card/model/card_model.dart';
import 'package:food_delivery_app/features/card/provider/card_provider.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  final CardProvider _cardProvider = CardProvider();
  final AuthController _authController = Get.find<AuthController>();

  var cards = <CardModel>[].obs;
  var isLoading = false.obs;
  var isError = false.obs;

  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchCards();
  }

  Future<void> fetchCards() async {
    try {
      isLoading.value = true;
      cards.value = await _cardProvider.getCards();
      update();
    } on DioException catch (e) {
      print(e.response!.data);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createCard() async {
    try {
      isLoading.value = true;
      final userId = _authController.userId.value;
      await _cardProvider.createCard(
        CardModel(
          userId: userId,
          holderName: holderNameController.text,
          cardNumber: cardNumberController.text,
          expireDate: expireDateController.text,
          cvv: int.tryParse(cvvController.text),
        ),
      );
    } on DioException catch (e) {
      print(e.response!.data);
    } finally {
      holderNameController.clear();
      cardNumberController.clear();
      expireDateController.clear();
      cvvController.clear();
      isLoading.value = false;
      Get.dialog(
        SuccessDialog(
          title: "Success",
          message: 'Card added successfully!',
          onPressed: () {
            fetchCards();
            Get.back();
            Get.back();
          },
        ),
      );
    }
  }
}
