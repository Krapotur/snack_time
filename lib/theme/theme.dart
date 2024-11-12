import 'package:flutter/material.dart';

final primaryTheme = ThemeData(
  useMaterial3: true,
  cardColor: Colors.white,
  scaffoldBackgroundColor: const Color.fromARGB(255, 246, 246, 246),
  primaryColor: const Color.fromARGB(255, 33, 156, 84),
  hintColor: const Color.fromARGB(255, 147, 147, 147),
  highlightColor: const Color.fromARGB(255, 245, 245, 245),
  dividerTheme: const DividerThemeData(color: Colors.grey),
  iconTheme: const IconThemeData(color: Colors.grey),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color.fromARGB(255, 29, 218, 108)),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 29, 218, 108)),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  fontFamily: 'Lora',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(fontSize: 13, color: Colors.grey),
  ),
);
