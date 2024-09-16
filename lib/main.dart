import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantCards());
}

class Restaurant {
  final String title;
  final String kitchen;
  final double raiting;
  final String imgSrc;

  const Restaurant(this.title, this.kitchen, this.raiting, this.imgSrc);
}

class RestaurantCards extends StatefulWidget {
  const RestaurantCards({super.key});

  @override
  State<RestaurantCards> createState() => _RestaurantCardsState();
}

class _RestaurantCardsState extends State<RestaurantCards> {
  final List<String> _kitchens = [
    'Мексиканская',
    'Кавказская',
    'Индийская',
    'Европейская',
    'Японская'
  ];

  final List<Restaurant> _restaurants = [
    const Restaurant('Оазис', 'Восточная', 5.0, 'assets/img/oasis.jpg'),
    const Restaurant(
        'Индийская душа', 'Индийская', 4.3, 'assets/img/india.jpg'),
    const Restaurant('Дербент', 'Кавказская', 4.6, 'assets/img/derbent.jpg'),
    const Restaurant('Борщ', 'Славянская', 4.5, 'assets/img/borsh.jpg'),
  ];

  final List<Card> _restaurantCards = [];

  late String title = _kitchens[0];

  @override
  void initState() {
    super.initState();
    _cardRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Рестораны',
            style: TextStyle(fontFamily: 'Lora'),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 3.0, bottom: 3.0),
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
              child: ListView.builder(
                itemCount: _restaurantCards.length,
                itemBuilder: (context, index) => _restaurantCards[index],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _kitchenButtons(String kitchen) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(title == kitchen
              ? const Color.fromARGB(255, 250, 134, 1)
              : const Color.fromARGB(255, 203, 203, 203)),
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

  void _cardRestaurant() {
    for (var res in _restaurants) {
      _restaurantCards.add(_createCardRestaurant(res));
    }
  }

  Card _createCardRestaurant(Restaurant res) {
    return Card(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              image: DecorationImage(
                  image: AssetImage(res.imgSrc), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 15),
            child: SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ресторан "${res.title}"',
                    style: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${res.kitchen} кухня',
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 15, fontFamily: 'Lora'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 22,
                    width: 52,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 250, 134, 1),
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
                            (res.raiting).toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Lora'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
