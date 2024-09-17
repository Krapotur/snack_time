import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';

import '../widgets/widgets.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  final List<String> _kitchens = [
    'Мексиканская',
    'Кавказская',
    'Индийская',
    'Европейская',
    'Японская'
  ];

  final List<Restaurant> _restaurants = [
    Restaurant('Оазис', 'Восточная', 5.0, 'assets/img/oasis.jpg', [
      const Position('Плов', 250, 180, 220, 'Горячие блюда'),
      const Position('Лагман', 240, 200, 200, 'Горячие блюда'),
      const Position('Кола', 100, 1, 20, 'Холодные напитки'),
      const Position('Махито', 130, 1, 15, 'Холодные напитки'),
      const Position('Мороженое', 150, 100, 220, 'Десерт'),
    ]),
    Restaurant('Индийская душа', 'Индийская', 4.3, 'assets/img/india.jpg', [
      const Position('Плов', 250, 180, 220, 'Горячие блюда'),
      const Position('Лагман', 240, 200, 200, 'Горячие блюда'),
      const Position('Кола', 100, 1, 20, 'Холодные напитки'),
      const Position('Махито', 130, 1, 15, 'Холодные напитки'),
      const Position('Мороженое', 150, 100, 220, 'Десерт'),
    ]),
    Restaurant('Дербент', 'Кавказская', 4.6, 'assets/img/derbent.jpg', [
      const Position('Плов', 250, 180, 220, 'Горячие блюда'),
      const Position('Лагман', 240, 200, 200, 'Горячие блюда'),
      const Position('Кола', 100, 1, 20, 'Холодные напитки'),
      const Position('Махито', 130, 1, 15, 'Холодные напитки'),
      const Position('Мороженое', 150, 100, 220, 'Десерт'),
    ]),
    Restaurant('Борщ', 'Славянская', 4.5, 'assets/img/borsh.jpg', [
      const Position('Плов', 250, 180, 220, 'Горячие блюда'),
      const Position('Лагман', 240, 200, 200, 'Горячие блюда'),
      const Position('Кола', 100, 1, 20, 'Холодные напитки'),
      const Position('Махито', 130, 1, 15, 'Холодные напитки'),
      const Position('Мороженое', 150, 100, 220, 'Десерт'),
    ]),
  ];

  final List<Widget> _restaurantCards = [];

  late String title = _kitchens[0];

  @override
  void initState() {
    super.initState();
    _getCardsRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Рестораны',
          style: TextStyle(fontFamily: 'Lora'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 1.0, top: 3.0, bottom: 3.0),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _kitchens.length,
                itemBuilder: (context, index) => _kitchenButtons(
                  _kitchens[index],
                ),
              ),
            ),
          ),
          Expanded(
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
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _kitchenButtons(String kitchen) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
            title == kitchen
                ? const Color.fromARGB(255, 250, 134, 1)
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
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontFamily: 'Lora'),
        ),
      ),
    );
  }

  void _getCardsRestaurant() {
    for (var res in _restaurants) {
      _restaurantCards.add(_createCardRestaurant(res));
    }
  }

  Widget _createCardRestaurant(Restaurant res) {
    return CardRestaurant(res: res);
  }
}
