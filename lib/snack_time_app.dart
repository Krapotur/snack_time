import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/restaurant_list/bloc/restaurant_list_bloc.dart';
import 'package:snack_time/repositories/repositories.dart';
import 'package:snack_time/router/router.dart';
import 'package:snack_time/theme/theme.dart';

class SnackTimeApp extends StatelessWidget {
  const SnackTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocProvider(
      create: (context) => RestaurantListBloc(
        RestaurantsRepository(dio: Dio()),
        KitchensRepository(dio: Dio()),
      ),
      child: MaterialApp.router(
        theme: primaryTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
