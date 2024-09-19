import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/features/restaurant_list/widgets/widgets.dart';

class CardRestaurant extends StatelessWidget {
  const CardRestaurant({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String url = 'http://10.101.11.31:5000/';
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                  image: NetworkImage(url + restaurant.imgSrc),
                  fit: BoxFit.cover),
            ),
          ),
          InfoRestaurant(restaurant: restaurant, theme: theme),
        ],
      ),
    );
  }
}
