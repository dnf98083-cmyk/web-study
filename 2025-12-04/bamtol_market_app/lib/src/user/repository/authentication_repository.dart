import 'package:bamtol_market_app/src/user/model/user_model.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxService {
  AuthenticationRepository();

  final Rx<UserModel?> _user = Rx<UserModel?>(null);

  Stream<UserModel?> get user => _user.stream;

  Future<bool> isLogined() async {
    return _user.value != null;
  }

  Future<void> logout() async {
    _user.value = null;
  }

  Future<void> signInWithGoogle() async {
    // Mock login
    _user.value = UserModel(
      uid: 'mock_user_uid',
      nickname: 'Mock User',
      temperature: 36.5,
    );
  }

  Future<void> signInWithApple() async {
    // Mock login
    _user.value = UserModel(
      uid: 'mock_user_uid',
      nickname: 'Mock User',
      temperature: 36.5,
    );
  }
}
