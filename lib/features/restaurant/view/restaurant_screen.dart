import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';
import 'package:snack_time/features/restaurant_list/bloc/restaurant_list_bloc.dart';

@RoutePage()
class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen(
      {super.key, required this.restaurant, required this.kitchenTitle});

  final Restaurant restaurant;
  final String kitchenTitle;

  @override
  State<RestaurantScreen> createState() => RestaurantScreenState();
}

class RestaurantScreenState extends State<RestaurantScreen> {
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
  Widget build(BuildContext context) {
    String url = 'http://10.101.11.31:5000/';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarImage(url: url, imgSrc: widget.restaurant.imgSrc),
          SliverAppBar(
            primary: false,
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,
            snap: false,
            stretch: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(125),
              child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RestaurantImage(restaurant: widget.restaurant),
                            InfoSummary(
                              restaurant: widget.restaurant,
                              kitchenTitle: widget.kitchenTitle,
                            ),
                          ],
                        ),
                        CaruselCategories(
                            categories: _categories,
                            categoryTitle: categoryTitle),
                      ],
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: ModalInfoAboutRestaurant(
                          url: url,
                          restaurant: widget.restaurant,
                          kitchenTitle: widget.kitchenTitle,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          BlocBuilder<RestaurantListBloc, RestaurantListState>(
            builder: (context, state) => SliverList(
              delegate: SliverChildBuilderDelegate(
                addAutomaticKeepAlives: false,
                semanticIndexOffset: 1,
                addRepaintBoundaries: false,
                childCount: 7,
                (context, i) => Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 150,
                  child: Center(child: Text('Контейнер: ${i + 1}')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _callState() {
    setState(() {});
  }
}
