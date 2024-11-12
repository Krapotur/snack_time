import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/positions/bloc/position_list_bloc.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/ui/shared/widgets/base_container.dart';
import 'package:snack_time/ui/shared/widgets/base_empty_list_widget.dart';

@RoutePage()
class PositionsScreen extends StatefulWidget {
  const PositionsScreen({super.key});

  @override
  State<PositionsScreen> createState() => PositionsScreenState();
}

class PositionsScreenState extends State<PositionsScreen> {
  String categoryTitle = 'Горячие блюда';
  List<Category> _categories = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator(
        color: theme.primaryColor,
        onRefresh: () async {
          final completer = Completer();
          BlocProvider.of<PositionListBloc>(context)
              .add(SearchPositionsListEvent(completer));
          return completer.future;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text(
                'VALENCIA R&K',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 5.0)
                      .copyWith(bottom: 5),
                  child: BlocBuilder<PositionListBloc, PositionListState>(
                    buildWhen: (previous, current) => _categories.isEmpty,
                    builder: (context, state) {
                      if (state is PositionListLoaded) {
                        _categories = state.categoriesList;
                        return SizedBox(
                          height: 40,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(bottom: 2),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.categoriesList.length,
                              itemBuilder: (context, index) {
                                Category category = state.categoriesList[index];
                                return GestureDetector(
                                  child: _categoryButtons(
                                      state.categoriesList[index]),
                                  onTap: () {
                                    BlocProvider.of<PositionListBloc>(context)
                                        .add(FilterPositionsByCategory(
                                            categoryID: category.id));
                                    setState(
                                        () => categoryTitle = category.title);
                                  },
                                );
                              }),
                        );
                      }
                      return const BaseEmptyListWidget();
                    },
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 10.0),
                child: Text(
                  'Акции',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 150,
                width: 80,
                child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) => BaseContainer(
                    color: const Color.fromARGB(255, 163, 247, 198),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/img/cofee+desert.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '200 руб',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'Кофе + десерт',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const PositionListView(),
          ],
        ),
      ),
    );
  }

  Widget _categoryButtons(Category category) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: categoryTitle == category.title
            ? Theme.of(context).primaryColor
            : const Color.fromARGB(255, 201, 201, 201),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(
          category.title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
