import 'package:flutter/material.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';
import 'package:snack_time/repositories/models.dart';

class ModalInfoAboutRestaurant extends StatelessWidget {
  const ModalInfoAboutRestaurant({
    super.key,
    required this.url,
    required this.restaurant,
    required this.kitchenTitle,
  });

  final String url;
  final Restaurant restaurant;
  final String kitchenTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.vertical(
                  top: Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  url + restaurant.imgSrc,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoSummary(
                  restaurant: restaurant,
                  kitchenTitle: kitchenTitle,
                ),
                const Divider(),
                Text(
                  restaurant.description,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const InfoContacts()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
