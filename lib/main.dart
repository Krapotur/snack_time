import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:snack_time/repositories/abstract_restaurants_repository.dart';
import 'package:snack_time/repositories/repositories.dart';
import 'package:snack_time/snack_time_app.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractRestaurantsRepository>(
      () => RestaurantsRepository(dio: Dio()));
  runApp(const SnackTimeApp());
}
