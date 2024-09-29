import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/features/restaurant_list/widgets/widgets.dart';
import 'package:snack_time/router/router.gr.dart';

class CardSliverList extends StatelessWidget {
  const CardSliverList({
    super.key,
    required this.url,
    required this.restaurantsList,
    required this.kitchensList,
  });

  final String url;
  final List<Restaurant> restaurantsList;
  final List<Kitchen> kitchensList;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: restaurantsList.length,
      itemBuilder: (context, i) => GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(RestaurantRoute(
              restaurant: restaurantsList[i],
              kitchenTitle: _getKitchenTitle(restaurantsList[i])));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          elevation: 5,
          color: Colors.white,
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
                      image: NetworkImage(url + restaurantsList[i].imgSrc),
                      fit: BoxFit.cover),
                ),
              ),
              InfoRestaurant(
                restaurant: restaurantsList[i],
                kitchen: _getKitchenTitle(restaurantsList[i]),
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, i) => const SizedBox(
        height: 5,
      ),
    );
  }

  String _getKitchenTitle(Restaurant restaurant) {
    String title = '';
    for (var kitchen in kitchensList) {
      if (restaurant.kitchen == kitchen.id) title = kitchen.title;
    }

    return title;
  }
}
