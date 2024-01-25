import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mylearning/features/bottom/view/bottom_view.dart';
import 'package:mylearning/features/details/view/details_view.dart';
import 'package:mylearning/features/home/view/home_view.dart';
import 'package:mylearning/features/messages/view/messages_view.dart';
import 'package:mylearning/features/notifications/view/notifications_view.dart';
import 'package:mylearning/utils/app_routes.dart';

class RouteManager {
  static final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  /* Don't use rootNavigatorKey use Get.key instead other wise Snackbar using Getx Don't work,
   Use it if you don't want Snackbar using getx
  */
  static final shellNavigatorkey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final router = GoRouter(
    // navigatorKey: Get.key,
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.kHome,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorkey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return BottomView(child: child);
        },
        routes: [
          /// The first screen to display in the bottom navigation bar.
          GoRoute(
            path: AppRoutes.kHome,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
            routes: [
              // The details screen to display stacked on the inner Navigator.
              // This will cover screen A but not the application shell.
              GoRoute(
                path: AppRoutes.kDetails,
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsView(label: 'Home');
                },
              ),
            ],
          ),

          ///Second Screen of the BottomNav
          GoRoute(
            path: AppRoutes.kNotification,
            builder: (BuildContext context, GoRouterState state) {
              return const NotificationsView();
            },
            routes: [
              // The details screen to display stacked on the inner Navigator.
              // This will cover screen A but not the application shell.
              GoRoute(
                path: AppRoutes.kDetails,
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsView(label: 'Notifications');
                },
              ),
            ],
          ),

          ///Thired Screen of the BottomNav
          GoRoute(
            path: AppRoutes.kMessage,
            builder: (BuildContext context, GoRouterState state) {
              return const MessagesView();
            },
            routes: [
              // The details screen to display stacked on the inner Navigator.
              // This will cover screen A but not the application shell.
              GoRoute(
                path: AppRoutes.kDetails,
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsView(label: 'Messages');
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
