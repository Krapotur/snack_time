import 'package:flutter/material.dart';

import 'features/restaurant/restaurant.dart';
import 'features/restaurant_list/restaurant_list.dart';

class SnackTimeApp extends StatelessWidget {
  const SnackTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 17,
            fontFamily: 'Lora',
            fontWeight: FontWeight.bold,
          ),
          labelMedium:
              TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'Lora'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        ('/'): (context) => const RestaurantListScreen(),
        ('/restaurant'): (context) => const RestaurantScreen(),
      },
    );
  }
}
