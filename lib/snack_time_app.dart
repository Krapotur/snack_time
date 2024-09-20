import 'package:flutter/material.dart';
import 'package:snack_time/router/router.dart';
import 'package:snack_time/theme/theme.dart';

class SnackTimeApp extends StatelessWidget {
  const SnackTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      theme: primaryTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
