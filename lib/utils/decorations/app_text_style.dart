import 'package:flutter/material.dart';

class AppTextStyle {
  // Private constructor.
  const AppTextStyle._();

  static const TextStyle thin = TextStyle(
    fontWeight: FontWeight.w100,
  );

  static const TextStyle extraLight = TextStyle(
    fontWeight: FontWeight.w200,
  );

  static const TextStyle light = TextStyle(
    fontWeight: FontWeight.w300,
  );

  static const TextStyle regular = TextStyle(
    fontWeight: FontWeight.normal,
  );

  static const TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
  );

  static const TextStyle semiBold = TextStyle(
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const TextStyle extraBold = TextStyle(
    fontWeight: FontWeight.w800,
  );

  static const TextStyle black = TextStyle(
    fontWeight: FontWeight.w900,
  );
}
