import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mylearning/utils/app_routes.dart';

class BottomView extends StatelessWidget {
  const BottomView({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (int index) {
          _onDestinationSelected(context, index);
        },
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRoutes.kHome)) {
      return 0;
    }
    if (location.startsWith(AppRoutes.kNotification)) {
      return 1;
    }
    if (location.startsWith(AppRoutes.kMessage)) {
      return 2;
    }
    return 0;
  }

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.kHome);
      case 1:
        context.go(AppRoutes.kNotification);
      case 2:
        context.go(AppRoutes.kMessage);
    }
  }
}
