import 'package:flutter/material.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';
import 'package:snack_time/repositories/positions/model/position.dart';

class GridPositions extends StatelessWidget {
  const GridPositions({
    super.key,
    required this.url,
    required this.positionsList,
  });

  final String url;
  final List<Position> positionsList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          mainAxisExtent: 215),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CardPosition(
            url: url,
            positionsList: positionsList,
            index: index,
          );
        },
        childCount: positionsList.length,
      ),
    );
  }
}
