import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  Future<void> login(String email, String password) async {
    await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> register(String email, String password) async {
    await _supabase.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    await _supabase.auth.signOut();
  }

  bool get isLoggedIn {
    return _supabase.auth.currentSession != null;
  }

  String? get accessToken {
    return _supabase.auth.currentSession?.accessToken;
  }

  String? get userId {
    return _supabase.auth.currentUser?.id;
  }
}
