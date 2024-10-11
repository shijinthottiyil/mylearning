import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: App(),
      locale: Locale('pt', 'BR'),
      translationsKeys: {
        'en_US': {
          'title': 'Hello from US',
        },
        'pt_BR': {
          'title': 'Ola do Brasil',
        }
      },
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'title'.tr,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('en', 'US'));
              },
              child: Text('Change locale to English'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('pt', 'BR'));
              },
              child: Text('Change locale to BRASIL'),
            ),
          ],
        ),
      ),
    );
  }
}
