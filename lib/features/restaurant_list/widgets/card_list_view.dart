import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';

class CardListView extends StatelessWidget {
  const CardListView({
    super.key,
    required this.restaurantCards,
    required this.restaurants,
  });

  final List<Widget> restaurantCards;
  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverList.separated(
        itemCount: restaurantCards.length,
        separatorBuilder: (context, i) => const SizedBox(height: 3),
        itemBuilder: (context, i) => GestureDetector(
          child: restaurantCards[i],
          onTap: () {
            Navigator.of(context)
                .pushNamed('/restaurant', arguments: restaurants[i]);
          },
        ),
      ),
    );
  }
}
