import 'package:bamtol_market_app/src/common/controller/authentication_controller.dart';
import 'package:bamtol_market_app/src/user/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final UserRepository _userRepository;
  final String uid;

  SignupController(this._userRepository, this.uid);

  final TextEditingController nicknameController = TextEditingController();
  RxBool isNicknameValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    nicknameController.addListener(() {
      print('Nickname changed: ${nicknameController.text}');
      isNicknameValid.value = nicknameController.text.isNotEmpty;
    });
  }

  void submit() {
    print('Submit called. Valid: ${isNicknameValid.value}');
    if (isNicknameValid.value) {
      // Create user model with nickname
      // var newUser = UserModel(
      //   uid: uid,
      //   nickname: nicknameController.text,
      // );

      // In a real app, we would save this to UserRepository
      // _userRepository.signup(newUser);

      // Update AuthenticationController
      print('Logging in...');
      Get.find<AuthenticationController>().login();
    }
  }
}
