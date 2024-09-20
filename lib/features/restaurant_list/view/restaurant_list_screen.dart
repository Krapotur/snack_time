import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/features/restaurant_list/widgets/widgets.dart';
import 'package:snack_time/repositories/kitchens_repository.dart';
import 'package:snack_time/repositories/restaurants_repository.dart';

@RoutePage()
class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  List<Restaurant> _restaurants = [];
  List<Kitchen> _kitchens = [];
  final List<Widget> _restaurantCards = [];
  late String title = _kitchens[0].title;

  void _getRestaurantList() async {
    _restaurants = await RestaurantsRepository().getRestaurantsList();
    _kitchens = await KitchenssRepository().getKitchensList();

    _getCardsRestaurant(_restaurants, _kitchens);
    _getKitchenTitleFromList(_restaurants, _kitchens);
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
            automaticallyImplyLeading: false,
            title: const Text('Рестораны',
                style: TextStyle(fontWeight: FontWeight.w600)),
            centerTitle: true,
            pinned: true,
            snap: true,
            floating: true,
            surfaceTintColor: Colors.white,
            bottom: _kitchens.isEmpty
                ? const PreferredSize(
                    preferredSize: Size.fromHeight(1), child: SizedBox())
                : PreferredSize(
                    preferredSize: const Size.fromHeight(73),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        children: [
                          const Text('Выберите кухню'),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 40,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              scrollDirection: Axis.horizontal,
                              itemCount: _kitchens.length,
                              separatorBuilder: (context, i) =>
                                  const SizedBox(),
                              itemBuilder: (context, index) => _kitchens.isEmpty
                                  ? const SizedBox()
                                  : _kitchenButtons(
                                      _kitchens[index],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          _restaurants.isEmpty
              ? const CircularIndicator()
              : CardListView(
                  restaurantCards: _restaurantCards, restaurants: _restaurants),
        ],
      ),
    );
  }

  Widget _kitchenButtons(Kitchen kitchen) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(
            title == kitchen.title
                ? Theme.of(context).primaryColor
                : Theme.of(context).highlightColor,
          ),
        ),
        onPressed: () {
          setState(() {
            title = kitchen.title;
            _filterCardByKitcchen(kitchen);
          });
        },
        child: Text(
          kitchen.title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  void _getCardsRestaurant(
      List<Restaurant> restaurantList, List<Kitchen> kitchens) {
    for (var res in restaurantList) {
      _restaurantCards.add(_createCardRestaurant(res, kitchens));
    }
  }

  Widget _createCardRestaurant(Restaurant restaurant, List<Kitchen> kitchens) {
    return CardRestaurant(restaurant: restaurant, kitchens: kitchens);
  }

  void _getKitchenTitleFromList(
      List<Restaurant> restaurantList, List<Kitchen> kitchenList) {
    final List<Kitchen> kitchenListActive = [
      const Kitchen(id: 'id', title: 'Все', imgSrc: '')
    ];

    for (var restaurant in restaurantList) {
      for (var kitchen in kitchenList) {
        if (restaurant.kitchen == kitchen.id &&
            !kitchenListActive.contains(kitchen)) {
          kitchenListActive.add(kitchen);
        }
      }
    }
    _kitchens = kitchenListActive;

    setState(() {});
  }

  void _filterCardByKitcchen(Kitchen kitchen) {}
}
