import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mylearning/utils/app_routes.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen Notifications'),
            TextButton(
              onPressed: () {
                context.go('${AppRoutes.kNotification}/${AppRoutes.kDetails}');
              },
              child: const Text('View Notifications details'),
            ),
          ],
        ),
      ),
    );
  }
}
