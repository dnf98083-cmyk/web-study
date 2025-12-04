import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/app.dart';

int count = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bamtol Market',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff212123),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff212123),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      getPages: [GetPage(name: '/', page: () => const App())],
    );
  }
}
