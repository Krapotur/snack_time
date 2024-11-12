import 'package:flutter/material.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';
import 'package:snack_time/repositories/positions/model/position.dart';

class GridPositions extends StatelessWidget {
  const GridPositions({
    super.key,
    required this.positionsList,
  });

  final List<Position> positionsList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 215),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CardPosition(
            positionsList: positionsList,
            index: index,
          );
        },
        childCount: positionsList.length,
      ),
    );
  }
}
