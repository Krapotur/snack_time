import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/positions/bloc/position_list_bloc.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';
import 'package:snack_time/repositories/models.dart';

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
              // bottom: PreferredSize(
              //   preferredSize: const Size.fromHeight(50),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //             vertical: 10.0, horizontal: 5.0)
              //         .copyWith(bottom: 5),
              //     child: BlocBuilder<PositionListBloc, PositionListState>(
              //       buildWhen: (previous, current) => _categories.isEmpty,
              //       builder: (context, state) {
              //         if (state is PositionListLoaded) {
              //           _categories = state.categoriesList;
              //           return SizedBox(
              //             height: 40,
              //             child: ListView.builder(
              //                 padding: const EdgeInsets.only(bottom: 2),
              //                 scrollDirection: Axis.horizontal,
              //                 itemCount: state.categoriesList.length,
              //                 itemBuilder: (context, index) {
              //                   Category category = state.categoriesList[index];
              //                   return GestureDetector(
              //                     child: _categoryButtons(
              //                         state.categoriesList[index]),
              //                     onTap: () {
              //                       BlocProvider.of<PositionListBloc>(context)
              //                           .add(FilterPositionsByCategory(
              //                               categoryID: category.id));
              //                       setState(
              //                           () => categoryTitle = category.title);
              //                     },
              //                   );
              //                 }),
              //           );
              //         }
              //         return const BaseEmptyListWidget();
              //       },
              //     ),
              //   ),
              // ),
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
            const EventsWidget(),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 10.0),
                child: Text(
                  'Вам понравится',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 110,
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(10).copyWith(bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/img/cofee+desert.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Долма'),
                            const Text(
                              '220р',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 30,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 50),
                                  GestureDetector(
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(20)),
                                        child: const Icon(
                                          Icons.add_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      onTap: () {
                                        // BlocProvider.of<CartBloc>(context).add(
                                        //     AddPositionCartEvent(
                                        //         position: widget.positionsList[
                                        //             widget.index]));
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverAppBar(
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: theme.scaffoldBackgroundColor,
              primary: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
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
                      return const SizedBox.shrink();
                    },
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
