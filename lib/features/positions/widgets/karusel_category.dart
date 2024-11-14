// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/positions/bloc/position_list_bloc.dart';
import 'package:snack_time/repositories/models.dart';

class KaruselCategory extends StatefulWidget {
  const KaruselCategory({Key? key}) : super(key: key);

  @override
  State<KaruselCategory> createState() => _KaruselCategoryState();
}

class _KaruselCategoryState extends State<KaruselCategory> {
  String categoryTitle = 'Горячие блюда';
  List<Category> _categories = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
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
                          child: _categoryButtons(state.categoriesList[index]),
                          onTap: () {
                            BlocProvider.of<PositionListBloc>(context).add(
                                FilterPositionsByCategory(
                                    categoryID: category.id));
                            setState(() => categoryTitle = category.title);
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
