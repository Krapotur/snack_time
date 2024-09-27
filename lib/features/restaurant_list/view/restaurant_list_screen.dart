import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/features/restaurant_list/bloc/restaurant_list_bloc.dart';
import 'package:snack_time/features/restaurant_list/widgets/widgets.dart';
import 'package:snack_time/ui/shared/widgets/loading_failure_widget.dart';

@RoutePage()
class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  List<Kitchen> _kitchens = [];
  late String title = _kitchens[0].title;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = 'http://10.101.11.31:5000/';

    return CustomScrollView(
      slivers: [
        BlocBuilder<RestaurantListBloc, RestaurantListState>(
          buildWhen: (previous, current) => _kitchens.isEmpty,
          builder: (context, state) {
            if (state is RestaurantListLoaded) {
              _kitchens = state.kitchenList;
              return SliverAppBar(
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
                        preferredSize: Size.fromHeight(30), child: Text('data'))
                    : PreferredSize(
                        preferredSize: const Size.fromHeight(55),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            children: [
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
                                  itemBuilder: (context, index) =>
                                      _kitchens.isEmpty
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
              );
            }
            return const SliverToBoxAdapter(child: SizedBox());
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 5,
          ),
        ),
        BlocBuilder<RestaurantListBloc, RestaurantListState>(
          builder: (context, state) {
            if (state is RestaurantListLoaded) {
              return CardSliverList(
                  url: url,
                  restaurantsList: state.restaurantList,
                  kitchensList: state.kitchenList);
            }
            return const SliverFillRemaining(
              child: LoadingFailureWidget(),
            );
          },
        )
      ],
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
          });
          BlocProvider.of<RestaurantListBloc>(context)
              .add(FilterRestaurantList(kitchenID: kitchen.id));
        },
        child: Text(
          kitchen.title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
