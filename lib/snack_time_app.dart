import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:snack_time/repositories/abstract_restaurants_repository.dart';
import 'package:snack_time/router/router.dart';
import 'package:snack_time/theme/theme.dart';

import 'features/restaurant_list/bloc/restaurant_list_bloc.dart';

class SnackTimeApp extends StatelessWidget {
  const SnackTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocProvider(
      create: (context) =>
          RestaurantListBloc(GetIt.I<AbstractRestaurantsRepository>()),
      child: MaterialApp.router(
        theme: primaryTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
