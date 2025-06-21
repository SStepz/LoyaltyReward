import 'package:flutter/material.dart';
import 'package:loyalty_challenge/src/data/models/user.dart';
import 'package:loyalty_challenge/src/data/services/login/login_mock_service.dart';
import 'package:loyalty_challenge/src/data/services/login/login_service_interface.dart';

class LoginViewModel extends ChangeNotifier {
  late LoginServiceInterface _loginService;

  bool _isLoading = false;
  String? error;

  bool get isLoading => _isLoading;

  LoginViewModel() {
    _loginService =
        LoginMockService(); // Replace with actual service implementation
  }

  Future<User?> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final user = await _loginService.login(email, password);
    _isLoading = false;
    notifyListeners();

    if (user == null) {
      error = 'Invalid email or password';
    } else {
      error = null;
    }
    return user;
  }
}
