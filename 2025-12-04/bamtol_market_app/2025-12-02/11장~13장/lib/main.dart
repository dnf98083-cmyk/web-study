import 'package:bamtol_market_app/src/common/controller/authentication_controller.dart';
import 'package:bamtol_market_app/src/common/controller/bottom_nav_controller.dart';
import 'package:bamtol_market_app/src/common/controller/root_controller.dart';
import 'package:bamtol_market_app/src/init/controller/data_load_controller.dart';
import 'package:bamtol_market_app/src/login/page/login_page.dart';
import 'package:bamtol_market_app/src/root.dart';
import 'package:bamtol_market_app/src/splash/controller/splash_controller.dart';
import 'package:bamtol_market_app/src/user/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';

late SharedPreferences prefs;
int count = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '당근마켓 클론 코딩',
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xff212123),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: const Color(0xff212123),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthenticationRepository());
        Get.put(SplashController());
        Get.put(DataLoadController());
        Get.put(AuthenticationController(Get.find()));
        Get.put(RootController());
        Get.put(BottomNavController());
      }),
      getPages: [
        GetPage(name: '/', page: () => const App()),
        GetPage(name: '/home', page: () => const Root()),
        GetPage(name: '/login', page: () => const LoginPage()),
        // GetPage(
        //   name: '/login',
        //   page: () => const LoginPage(),
        //   binding: BindingsBuilder(() {
        //     Get.lazyPut<LoginController>(
        //       () => LoginController(Get.find<AuthenticationRepository>()),
        //     );
        //   }),
        // ),
        // GetPage(
        //   name: '/signup/:uid',
        //   page: () => const SignupPage(),
        //   binding: BindingsBuilder(() {
        //     Get.create<SignupController>(
        //       () => SignupController(
        //         Get.find<UserRepository>(),
        //         Get.parameters['uid'] as String,
        //       ),
        //     );
        //   }),
        // ),
      ],
    );
  }
}
