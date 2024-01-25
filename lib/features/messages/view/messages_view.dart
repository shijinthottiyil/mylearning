import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mylearning/utils/app_routes.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen Messages'),
            TextButton(
              onPressed: () {
                // context.go('/b/details');
                context.go('${AppRoutes.kMessage}/${AppRoutes.kDetails}');
              },
              child: const Text('View Messages details'),
            ),
          ],
        ),
      ),
    );
  }
}
