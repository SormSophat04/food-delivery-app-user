import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;
  final _secureStorage = const FlutterSecureStorage();

  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var userId = ''.obs;
  var token = ''.obs;

  @override
  void onInit() {
    checkSession();
    super.onInit();
  }

  void checkSession() {
    final session = supabase.auth.currentSession;
    if (session != null) {
      isLoggedIn.value = true;
      userId.value = supabase.auth.currentUser!.id;
      token.value = session.accessToken;
    }
  }

  Future<String?> getStoredToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: 'auth_token');
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      userId.value = res.user!.id;
      isLoggedIn.value = true;
      token.value = res.session!.accessToken;

      // Store token securely
      await saveToken(token.value);

      Get.offAllNamed('/home');
    } on AuthException catch (e) {
      Get.snackbar('Login Failed', e.message);
      print(e.message);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      isLoading.value = true;

      await supabase.auth.signUp(
        email: email,
        password: password,
      );

      Get.snackbar('Success', 'Account created. Please login.');
      Get.back();
    } on AuthException catch (e) {
      Get.snackbar('Register Failed', e.message);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
    // Delete token from secure storage
    await deleteToken();
    isLoggedIn.value = false;
    userId.value = '';
    token.value = '';
    Get.offAllNamed('/login');
  }
}
