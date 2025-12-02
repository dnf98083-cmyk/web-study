import 'package:get/get.dart';

class AuthenticationRepository extends GetxService {
  Future<bool> isLogined() async {
    // TODO: 실제 로그인 체크 로직 구현 (예: 토큰 확인)
    await Future.delayed(const Duration(milliseconds: 1000));
    return false; // 초기에는 로그인 안 된 상태로 설정
  }

  Future<void> logout() async {
    // TODO: 로그아웃 로직 구현
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
