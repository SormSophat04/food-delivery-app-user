import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/widgets/success_dialog.dart';
import 'package:food_delivery_app/features/address/model/address_model.dart';
import 'package:food_delivery_app/features/address/provider/address_provider.dart';
import 'package:food_delivery_app/features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final AddressProvider _addressProvider = AddressProvider();
  final AuthController _authController = Get.find<AuthController>();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();

  var address = <AddressModel>[].obs;
  var addressDefault = <AddressModel>[].obs;
  var defaultAddress = Rxn<AddressModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    try {
      isLoading.value = true;
      final addresses = await _addressProvider.getAddress();
      address.value = addresses;
      _setDefaultFromList(addresses);
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load addresses: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchDefaultAddresses() async {
    try {
      isLoading.value = true;
      final addresses = await _addressProvider.getAddressDefault(true);
      addressDefault.value = addresses;
      _setDefaultFromList(addresses);
      update();
    } on DioException catch (e) {
      print(e.response?.statusCode);
      print(e.response?.data);
    } finally {
      isLoading(false);
    }
  }

  Future<void> createAddress() async {
    try {
      isLoading.value = true;
      final userId = _authController.userId.value;
      if (userId.isEmpty) {
        Get.snackbar('Error', 'User not logged in.');
        return;
      }

      await _addressProvider.createAddress(
        AddressModel(
          id: null,
          userId: userId,
          address: addressController.text,
          place: apartmentController.text,
          createdAt: null,
          latitude: 11.5431,
          longitude: 104.9211,
          isDefault: false,
        ),
      );

      Get.dialog(SuccessDialog(
        title: 'Success',
        message: 'Address created successfully',
        onPressed: () {
          fetchAddresses();
          Get.back();
          Get.back();
        },
      ));
    } on DioException catch (e) {
      log('Status: ${e.response?.statusCode}');
      log('Body: ${e.response?.data}');
      Get.snackbar('Error', e.response?.data?.toString() ?? 'Failed to create');
    } finally {
      isLoading.value = false;
    }
  }

  void _setDefaultFromList(List<AddressModel> list) {
    AddressModel? found;
    for (final item in list) {
      if (item.isDefault == true) {
        found = item;
        break;
      }
    }
    defaultAddress.value = found;
  }
}
