import 'package:loyalty_challenge/src/data/models/user.dart';

abstract class LoginServiceInterface {
  /// Returns a User object if the login is successful, or `null` if it fails.
  Future<User?> login(String email, String password);
}
