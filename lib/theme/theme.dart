import 'package:flutter/material.dart';

final primaryTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color.fromARGB(255, 233, 123, 39),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 233, 123, 39)),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  fontFamily: 'Gilroy',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(color: Colors.grey, fontSize: 13),
  ),
);
