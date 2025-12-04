import 'package:bamtol_market_app/src/user/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _authenticationRepository;

  LoginController(this._authenticationRepository);

  void googleLogin() async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    await Future.delayed(const Duration(seconds: 1));

    Get.back(); // Close dialog

    Get.toNamed('/signup/12345');
  }

  void appleLogin() {}
}
