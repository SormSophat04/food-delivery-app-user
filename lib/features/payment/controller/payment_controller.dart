import 'package:get/get.dart';

class PaymentController extends GetxController {
  var isLoading = false.obs;
  var selectedPaymentIndex = 0.obs;

  void selectPayment(int index) {
    if (selectedPaymentIndex.value == index) {
      return;
    }
    selectedPaymentIndex.value = index;
    update();
  }
}
