import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => RestaurantScreenState();
}

class RestaurantScreenState extends State<RestaurantScreen> {
  Restaurant? restaurant;
  String categoryTitle = 'Горячие блюда';

  final List<String> _categories = [
    'Популярное',
    'Горячие блюда',
    'Холодные блюда',
    'Напитки',
    'Кофе',
    'Десерты'
  ];

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is Restaurant,
        'You must provide Object Restaurant args');

    restaurant = args as Restaurant;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String url = 'http://10.101.11.31:5000/';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 249, 249),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topCenter,
              image: NetworkImage(url + restaurant!.imgSrc),
              fit: BoxFit.fitWidth),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const IconArrowBack(),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 10),
                child: Card(
                  surfaceTintColor: Colors.white,
                  child: Row(
                    children: [
                      RestaurantImage(restaurant: restaurant),
                      CardInfoRestaurant(restaurant: restaurant),
                    ],
                  ),
                ),
              ),
              Card(
                surfaceTintColor: Colors.white,
                child: SizedBox(
                  height: 50,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      const IconMenu(),
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0, right: 5.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _categories.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(
                                      () => categoryTitle = _categories[index]);
                                },
                                child: TitleCategory(
                                  categories: _categories,
                                  categoryTitle: categoryTitle,
                                  index: index,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
