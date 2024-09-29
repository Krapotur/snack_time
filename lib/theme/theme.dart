import 'package:flutter/material.dart';

final primaryTheme = ThemeData(
  useMaterial3: true,
  cardColor: Colors.white,
  scaffoldBackgroundColor: const Color.fromARGB(239, 255, 255, 255),
  primaryColor: const Color.fromARGB(255, 233, 123, 39),
  hintColor: Colors.grey,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color.fromARGB(255, 233, 123, 39)),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 233, 123, 39)),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  fontFamily: 'Gilroy',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(fontSize: 13, color: Colors.grey),
  ),
);
