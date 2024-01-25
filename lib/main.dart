// ==========================================================================NESTED NAVIGATION USING GOROUTER WITH GETX=================================================================================================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mylearning/utils/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      defaultTransition: Transition.fade,
      routerDelegate: RouteManager.router.routerDelegate,
      backButtonDispatcher: RouteManager.router.backButtonDispatcher,
      routeInformationParser: RouteManager.router.routeInformationParser,
      routeInformationProvider: RouteManager.router.routeInformationProvider,
    );
  }
}
