import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylearning/features/welcome/view/welcome_view.dart';
import 'package:mylearning/utils/decorations/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.kWhite, // Background color of the status bar
      statusBarIconBrightness:
          Brightness.dark, // Brightness of the status bar icons
      systemNavigationBarColor: AppColors
          .kWhite, // Background color of the navigation bar (on Android)
      systemNavigationBarIconBrightness: Brightness
          .dark, // Brightness of the navigation bar icons (on Android)
    ));
    return MaterialApp(
      title: 'Fruzzdigital',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kWhite,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        iconTheme: const IconThemeData(color: AppColors.kDark),
      ),
      home: const WelcomeView(),
    );
  }
}
