import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/cart/bloc/cart_bloc.dart';
import 'package:snack_time/features/home/widgets/widgets.dart';
import 'package:snack_time/features/restaurant/bloc/position_list_bloc.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/ui/shared/widgets/loading_failure_widget.dart';

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
  String categoryTitle = '';

  List<Category> _categories = [];

  @override
  void initState() {
    BlocProvider.of<PositionListBloc>(context).add(
        FilterPositionsListEvent(restaurantID: widget.restaurant.id as String));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = 'http://10.101.11.31:5000/';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarImage(url: url, imgSrc: widget.restaurant.imgSrc),
          SliverAppBar(
            primary: false,
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,
            snap: false,
            stretch: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(110),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.info_outline_rounded),
                                RestaurantImage(
                                    imgSrc: widget.restaurant.imgSrc),
                              ],
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
                        InfoSummary(
                          restaurant: widget.restaurant,
                          kitchenTitle: widget.kitchenTitle,
                        ),
                      ],
                    ),
                    BlocBuilder<PositionListBloc, PositionListState>(
                        buildWhen: (previous, current) => _categories.isEmpty,
                        builder: (context, state) {
                          if (state is PositionListLoaded) {
                            _categories = state.categoriesList;
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: SizedBox(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.categoriesList.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(right: 2),
                                      child: _categoryButtons(
                                          state.categoriesList[index]),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container(
                            color: Colors.red,
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<PositionListBloc, PositionListState>(
              builder: (context, state) {
            if (state is PositionListLoading) {
              return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()));
            }

            if (state is PositionListLoaded) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                sliver: GridPositions(
                  url: url,
                  positionsList: state.positionsList,
                ),
              );
            }
            if (state is PositionListFailure) {
              return const SliverFillRemaining(
                child: LoadingFailureWidget(),
              );
            }
            return const SliverFillRemaining(
              child: LoadingFailureWidget(),
            );
          }),
        ],
      ),
      floatingActionButton:
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        return state.cartPositions.isNotEmpty
            ? FloatActionButton(positions: state.cartPositions)
            : const SizedBox();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _callState() {
    setState(() {});
  }

  Widget _categoryButtons(Category category) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(
            categoryTitle == category.title
                ? Theme.of(context).primaryColor
                : Theme.of(context).hintColor,
          ),
        ),
        onPressed: () {
          BlocProvider.of<PositionListBloc>(context).add(
              FilterPositionsByCategory(
                  categoryID: category.id,
                  restaurantID: widget.restaurant.id as String));
          setState(() {
            categoryTitle = category.title;
          });
        },
        child: Text(
          category.title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
