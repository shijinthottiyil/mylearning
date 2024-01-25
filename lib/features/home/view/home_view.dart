import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mylearning/utils/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen Home'),
            TextButton(
              onPressed: () {
                Get.snackbar('title', 'message');
                // context.go('/a/details');
                // context.go('${AppRoutes.kHome}/${AppRoutes.kDetails}');
              },
              child: const Text('View Home details'),
            ),
          ],
        ),
      ),
    );
  }
}
