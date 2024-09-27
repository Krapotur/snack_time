import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/features/restaurant_list/widgets/widgets.dart';

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
      padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 15.0),
      child: SizedBox(
        width: double.infinity,
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  IconContainer(
                    icon: Icons.star,
                    label: (restaurant.rating).toString(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const IconContainer(
                    icon: Icons.directions_run,
                    label: 'Бесплатно',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
