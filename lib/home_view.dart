import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var channel = const MethodChannel("shijin");
  showToast(String message) async {
    await channel.invokeMethod('ShowToast', {"message": message});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showToast('Custom Message');
          },
          child: const Text('Show Toast'),
        ),
      ),
    );
  }
}
