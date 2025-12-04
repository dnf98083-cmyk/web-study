import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/common/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthenticationController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 99,
                  height: 116,
                  child: Image.asset('assets/images/logo_simbol.png'),
                ),
                const SizedBox(height: 40),
                const AppFont(
                  '당신 근처의 밤톨마켓',
                  fontWeight: FontWeight.bold,
                  size: 20,
                ),
                const SizedBox(height: 15),
                AppFont(
                  '중고 거래부터 동네 정보까지, \n지금 내 동네를 선택하고 시작해보세요!',
                  align: TextAlign.center,
                  size: 18,
                  color: Colors.white.withOpacity(0.6),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white.withOpacity(0.3),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppFont(
                        '회원가입/로그인',
                        color: Colors.white.withOpacity(0.6),
                        size: 13,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white.withOpacity(0.3),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _loginButton(
                  'Google로 계속하기',
                  'assets/images/google.png',
                  () {
                    controller.login();
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 15),
                _loginButton(
                  'Apple로 계속하기',
                  'assets/images/apple.png',
                  () {
                    controller.login();
                  },
                  color: Colors.black,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton(
    String text,
    String iconPath,
    VoidCallback onTap, {
    Color color = Colors.white,
    Color textColor = Colors.black,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 0,
              bottom: 0,
              child: Image.asset(iconPath, width: 20, height: 20),
            ),
            Center(
              child: AppFont(
                text,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
