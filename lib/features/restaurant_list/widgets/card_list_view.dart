import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';

class CardListView extends StatelessWidget {
  const CardListView({
    super.key,
    required List<Widget> restaurantCards,
    required List<Restaurant> restaurants,
  })  : _restaurantCards = restaurantCards,
        _restaurants = restaurants;

  final List<Widget> _restaurantCards;
  final List<Restaurant> _restaurants;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: _restaurantCards.length,
          itemBuilder: (context, i) => GestureDetector(
            child: _restaurantCards[i],
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/restaurant', arguments: _restaurants[i]);
            },
          ),
        ),
      ),
    );
  }
}
