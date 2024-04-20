import 'package:flutter/material.dart';
import 'package:mylearning/explicit/login_animation.dart';
import 'package:mylearning/implicit/animated_shopping_cart_button.dart';
import 'package:mylearning/implicit/regenerate_color_view.dart';
import 'package:mylearning/implicit/tween_animation_builder_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginAnimation(),
    );
  }
}
