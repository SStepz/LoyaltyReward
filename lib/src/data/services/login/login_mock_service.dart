import 'package:loyalty_challenge/src/data/models/user.dart';
import 'package:loyalty_challenge/src/data/services/login/login_service_interface.dart';
import 'package:loyalty_challenge/src/common/constants/account_const.dart';

class LoginMockService implements LoginServiceInterface {
  @override
  Future<User?> login(String email, String password) async {
    if (email == dummyEmail && password == dummyPassword) {
      return User(email: email, fullName: 'Smile Fokus');
    }
    return null;
  }
}
