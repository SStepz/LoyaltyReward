import 'package:loyalty_challenge/src/data/models/user.dart';
import 'package:loyalty_challenge/src/data/services/login/login_service_interface.dart';

class LoginService implements LoginServiceInterface {
  @override
  Future<User?> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
