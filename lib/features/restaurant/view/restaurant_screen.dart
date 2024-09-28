import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';
import 'package:snack_time/features/restaurant_list/bloc/restaurant_list_bloc.dart';

@RoutePage()
class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.restaurant});

  final Restaurant restaurant;
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
          SliverAppBar(
            automaticallyImplyLeading: true,
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            pinned: false,
            floating: false,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              background: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: <Color>[Colors.white, Colors.transparent],
                  ),
                ),
                child: Image.network(
                  url + widget.restaurant.imgSrc,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverAppBar(
            primary: false,
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: true,
            pinned: true,
            floating: false,
            snap: false,
            stretch: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(125),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RestaurantImage(restaurant: widget.restaurant),
                        CardInfoRestaurant(restaurant: widget.restaurant),
                      ],
                    ),
                    const Divider(),
                    CaruselCategories(
                        categories: _categories, categoryTitle: categoryTitle),
                  ],
                ),
              ),
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
}

class CaruselCategories extends StatelessWidget {
  const CaruselCategories({
    super.key,
    required List<String> categories,
    required this.categoryTitle,
  }) : _categories = categories;

  final List<String> _categories;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      color: Colors.white,
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
                        // setState(
                        //     () => categoryTitle = _categories[index]);
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
    );
  }
}
