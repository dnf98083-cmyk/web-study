import 'package:flutter/material.dart';
import 'widgets/bamtol_text.dart';
import '../main.dart'; // 전역 변수 count 접근을 위해 import

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BamtolText(
          'Bamtol Market',
          size: 20,
          weight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_simbol.png', width: 100),
            const SizedBox(height: 20),
            const BamtolText(
              'Welcome to Bamtol Market!',
              size: 18,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 20),
            BamtolText(
              'Count: $count',
              size: 24,
              weight: FontWeight.bold,
              color: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
