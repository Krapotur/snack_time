import 'package:flutter/material.dart';
import 'package:snack_time/router/router.dart';
import 'package:snack_time/theme/theme.dart';

class SnackTimeApp extends StatelessWidget {
  const SnackTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: primaryTheme,
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
