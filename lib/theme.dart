import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo), // 알아서 primary, secondary, tertiary 를 맞춰준다
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
    bodySmall: TextStyle(fontSize: 22),
  ),
);
