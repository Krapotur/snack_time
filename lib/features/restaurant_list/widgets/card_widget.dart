import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/features/restaurant_list/widgets/widgets.dart';

class CardRestaurant extends StatelessWidget {
  const CardRestaurant({
    super.key,
    required this.restaurant,
    required this.kitchens,
  });

  final Restaurant restaurant;
  final List<Kitchen> kitchens;

  @override
  Widget build(BuildContext context) {
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
          InfoRestaurant(
            restaurant: restaurant,
            kitchen: _getKitchenTitle(),
          ),
        ],
      ),
    );
  }

  String _getKitchenTitle() {
    String title = '';
    for (var kitchen in kitchens) {
      if (restaurant.kitchen == kitchen.id) title = kitchen.title;
    }
    return title;
  }
}
