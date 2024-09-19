import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/repositories/restaurants_repository.dart';

import '../widgets/widgets.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  List<Restaurant> _restaurants = [];
  final List<String> _kitchens = [];
  final List<Widget> _restaurantCards = [];
  late String title = _kitchens[0];

  void _getRestaurantList() async {
    _restaurants = await RestaurantsRepository().getRestaurantsList();
    _getCardsRestaurant(_restaurants);
    _getKitchenTitleFromList(_restaurants);
  }

  @override
  void initState() {
    _getRestaurantList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Рестораны'),
            centerTitle: true,
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: Theme.of(context).primaryColor,
            bottom: const PreferredSize(
              child: TextField(),
              preferredSize: Size.fromHeight(70),
            ),
          )
        ],
      ),

      //  _restaurants.isEmpty
      //     ? Center(
      //         child: CircularProgressIndicator(
      //           color: Theme.of(context).primaryColor,
      //         ),
      //       )
      //     : Column(
      //         children: <Widget>[
      //           Padding(
      //             padding:
      //                 const EdgeInsets.only(left: 1.0, top: 3.0, bottom: 3.0),
      //             child: SizedBox(
      //               height: 40,
      //               child: ListView.builder(
      //                 scrollDirection: Axis.horizontal,
      //                 itemCount: _kitchens.length,
      //                 itemBuilder: (context, index) => _kitchenButtons(
      //                   _kitchens[index],
      //                 ),
      //               ),
      //             ),
      //           ),
      //           CardListView(
      //               restaurantCards: _restaurantCards,
      //               restaurants: _restaurants),
      //         ],
      //       ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _kitchenButtons(String kitchen) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
            title == kitchen
                ? Theme.of(context).primaryColor
                : const Color.fromARGB(255, 203, 203, 203),
          ),
        ),
        onPressed: () {
          setState(() {
            title = kitchen;
          });
        },
        child: Text(
          kitchen,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  void _getCardsRestaurant(List<Restaurant> restaurantList) {
    for (var res in restaurantList) {
      _restaurantCards.add(_createCardRestaurant(res));
    }
  }

  Widget _createCardRestaurant(Restaurant restaurant) {
    return CardRestaurant(restaurant: restaurant);
  }

  void _getKitchenTitleFromList(List<Restaurant> restaurantList) {
    for (var restaurant in restaurantList) {
      _kitchens.add(restaurant.kitchen);
    }
    setState(() {});
  }
}
