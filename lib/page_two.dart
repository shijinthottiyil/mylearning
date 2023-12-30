import 'package:flutter/material.dart';
import 'package:mylearning/page_three.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageTwo'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const PageThree(),
            );
          },
          child: const Text('GOTO PAGE 3'),
        ),
      ),
    );
  }
}
