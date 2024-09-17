import 'package:flutter/material.dart';
import 'package:snack_time/features/models/models.dart';

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
    print(restaurant?.positions[0].title);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage(restaurant!.imgSrc),
              fit: BoxFit.fitWidth),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed('/'),
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 10),
                child: Card(
                  surfaceTintColor: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(restaurant!.imgSrc),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '"${restaurant!.title}"',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  height: 22,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 250, 134, 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          ('4.5').toString(),
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
                          Text(
                            '${restaurant!.kitchen} кухня',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            'Часы работы: 10:00 - 23:00',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                surfaceTintColor: Colors.white,
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) => TextButton(
                      onPressed: () {
                        setState(() {
                          categoryTitle = _categories[index];
                        });
                      },
                      child: Text(
                        _categories[index],
                        style: TextStyle(
                            color: categoryTitle == _categories[index]
                                ? const Color.fromARGB(255, 250, 134, 1)
                                : Colors.grey,
                            fontFamily: 'Lora',
                            fontWeight: categoryTitle == _categories[index]
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
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
