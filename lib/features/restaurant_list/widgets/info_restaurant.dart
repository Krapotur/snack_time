import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';

class InfoRestaurant extends StatelessWidget {
  const InfoRestaurant({
    super.key,
    required this.restaurant,
    required this.kitchen,
  });

  final Restaurant restaurant;
  final String kitchen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 15),
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${restaurant.typePlace == 'restaurant' ? 'Ресторан' : 'Кафе'} "${restaurant.title}"',
                style: theme.textTheme.titleMedium),
            Text(
              '$kitchen кухня',
              style: theme.textTheme.labelMedium,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 22,
              width: 52,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.white,
                    ),
                    Text(
                      (restaurant.rating).toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
