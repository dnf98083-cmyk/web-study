import 'package:bamtol_market_app/src/user/model/user_model.dart';
import 'package:bamtol_market_app/src/user/repository/authentication_repository.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationController(this._authenticationRepository);

  RxBool isLoggedIn = false.obs;
  Rx<UserModel> userModel = const UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    _authenticationRepository.user.listen((user) {
      if (user != null) {
        userModel(user);
        isLoggedIn(true);
      } else {
        isLoggedIn(false);
      }
    });
  }

  void authCheck() async {
    bool result = await _authenticationRepository.isLogined();
    isLoggedIn(result);
  }

  void login() {
    isLoggedIn(true);
    Get.offAllNamed('/home');
  }

  void logout() {
    _authenticationRepository.logout();
    isLoggedIn(false);
  }
}
