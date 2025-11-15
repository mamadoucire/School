import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  String? _token;
  bool get isLoggedIn => _token != null;

  String? get token => _token;

  // Mock login
  Future<bool> login({required String email, required String password}) async {
    await Future.delayed(Duration(milliseconds: 700)); // simulate network
    if (email.isNotEmpty && password.length >= 4) {
      _token = 'mock_token_123';
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}
