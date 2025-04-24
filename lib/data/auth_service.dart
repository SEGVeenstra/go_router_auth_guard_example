import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  AuthService._();

  static final AuthService _instance = AuthService._();

  factory AuthService() => _instance;

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
