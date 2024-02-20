import 'package:flutter/material.dart';
import 'package:mylearning/animated_icon_example.dart';

void main() {
  runApp(AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedIconExample(),
    );
  }
}
