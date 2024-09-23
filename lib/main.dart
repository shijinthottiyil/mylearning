/// This branch is used for learning custom painter
/// using flutter

import 'package:flutter/material.dart';
import 'package:mylearning/custom_painter/draw_rect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DrawRect(),
    );
  }
}
