import 'package:flutter/material.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';
import 'package:snack_time/repositories/positions/model/position.dart';

class InfoAboutCaloric extends StatelessWidget {
  const InfoAboutCaloric({
    super.key,
    required this.widget,
  });

  final CardPosition widget;

  @override
  Widget build(BuildContext context) {
    Position position = widget.positionsList[widget.index];

    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.highlightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${position.caloric.toString()}г',
                  style: theme.textTheme.labelSmall),
              Text('ккал', style: theme.textTheme.labelSmall),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${position.proteins.toString()}г',
                  style: theme.textTheme.labelSmall),
              Text('белки', style: theme.textTheme.labelSmall),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${position.fats.toString()}г',
                  style: theme.textTheme.labelSmall),
              Text('жиры', style: theme.textTheme.labelSmall),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${position.carbs.toString()}г',
                  style: theme.textTheme.labelSmall),
              Text('углеводы', style: theme.textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
