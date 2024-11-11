import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/cart/bloc/cart_bloc.dart';
import 'package:snack_time/features/positions/bloc/position_list_bloc.dart';
import 'package:snack_time/repositories/repositories.dart';
import 'package:snack_time/router/router.dart';
import 'package:snack_time/theme/theme.dart';

class SnackTimeApp extends StatelessWidget {
  const SnackTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio();
    final appRouter = AppRouter();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PositionsRepository>(
            create: (context) => PositionsRepository(dio: dio)),
        RepositoryProvider<CategoriesRepository>(
            create: (context) => CategoriesRepository(dio: dio)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PositionListBloc>(
            create: (BuildContext context) => PositionListBloc(
                positionsRepository: context.read<PositionsRepository>(),
                categoriesRepository: context.read<CategoriesRepository>()),
          ),
          BlocProvider<CartBloc>(
            create: (BuildContext context) => CartBloc(),
          ),
        ],
        child: MaterialApp.router(
          theme: primaryTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
        ),
      ),
    );
  }
}
