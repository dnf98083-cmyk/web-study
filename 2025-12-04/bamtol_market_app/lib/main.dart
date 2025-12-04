import 'package:bamtol_market_app/src/common/components/multiful_image_view.dart';
import 'package:bamtol_market_app/src/common/controller/authentication_controller.dart';
import 'package:bamtol_market_app/src/common/controller/bottom_nav_controller.dart';
import 'package:bamtol_market_app/src/common/controller/common_layout_controller.dart';
import 'package:bamtol_market_app/src/common/controller/root_controller.dart';
import 'package:bamtol_market_app/src/common/repository/cloud_firebase_storage_repository.dart';
import 'package:bamtol_market_app/src/product/repository/product_repository.dart';
import 'package:bamtol_market_app/src/home/controller/product_controller.dart';
import 'package:bamtol_market_app/src/product/write/controller/product_write_controller.dart';
import 'package:bamtol_market_app/src/product/write/page/product_write_page.dart';
import 'package:bamtol_market_app/src/init/controller/data_load_controller.dart';
import 'package:bamtol_market_app/src/user/login/controller/login_controller.dart';
import 'package:bamtol_market_app/src/user/login/page/login_page.dart';
import 'package:bamtol_market_app/src/root.dart';
import 'package:bamtol_market_app/src/user/signup/controller/signup_controller.dart';
import 'package:bamtol_market_app/src/user/signup/page/signup_page.dart';
import 'package:bamtol_market_app/src/splash/controller/splash_controller.dart';
import 'package:bamtol_market_app/src/user/repository/authentication_repository.dart';
import 'package:bamtol_market_app/src/user/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';

late SharedPreferences prefs;
int count = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // Removed Firebase init
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
        Get.put(UserRepository());
        Get.put(ProductRepository());
        Get.put(CloudFirebaseRepository());
        Get.put(SplashController());
        Get.put(DataLoadController());
        Get.put(AuthenticationController(Get.find()));
        Get.put(CommonLayoutController());
        Get.put(RootController());
        Get.put(BottomNavController());
        Get.put(ProductController());
      }),
      getPages: [
        GetPage(name: '/', page: () => const App()),
        GetPage(name: '/home', page: () => const Root()),
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<LoginController>(
              () => LoginController(Get.find<AuthenticationRepository>()),
            );
          }),
        ),
        GetPage(
          name: '/signup/:uid',
          page: () => const SignupPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SignupController>(
              () => SignupController(
                Get.find<UserRepository>(),
                Get.parameters['uid'] as String,
              ),
            );
          }),
        ),
        GetPage(
          name: '/product/write',
          page: () => const ProductWritePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<ProductWriteController>(
              () => ProductWriteController(
                Get.find<AuthenticationController>().userModel.value,
                Get.find<ProductRepository>(),
                Get.find<CloudFirebaseRepository>(),
              ),
            );
          }),
        ),
        GetPage(
          name: '/MultifulImageView',
          page: () => MultifulImageView(initImages: Get.arguments),
        ),
      ],
    );
  }
}
