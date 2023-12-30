import 'package:flutter/material.dart';
import 'package:mylearning/page_four.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageThree'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const PageFour(),
            );
          },
          child: const Text('GOTO PAGE 4'),
        ),
      ),
    );
  }
}
