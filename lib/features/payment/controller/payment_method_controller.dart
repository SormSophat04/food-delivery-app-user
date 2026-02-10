import 'package:food_delivery_app/features/payment/model/payment_method_model.dart';
import 'package:food_delivery_app/features/payment/provider/payment_method_provider.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  final PaymentMethodProvider _paymentMethodProvider = PaymentMethodProvider();

  var paymentMethods = <PaymentMethodModel>[].obs;
  var isLoading = false.obs;
  var selectedPaymentMethodId = Rxn<int>();

  var selectedPaymentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPaymentMethods();
  }

  void selectPayment(int index) {
    if (selectedPaymentIndex.value == index) {
      return;
    }
    selectedPaymentIndex.value = index;
    update();
  }

  Future<void> fetchPaymentMethods() async {
    try {
      isLoading(true);
      final methods = await _paymentMethodProvider.getPaymentMethods();
      paymentMethods.value = methods;
      if (methods.isNotEmpty) {
        selectedPaymentMethodId.value = methods.first.id;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load payment methods: $e');
    } finally {
      update();
      isLoading(false);
    }
  }

  void selectPaymentMethod(int? id) {
    selectedPaymentMethodId.value = id;
  }
}
