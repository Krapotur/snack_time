import 'package:flutter/material.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';

class InfoAboutCaloric extends StatelessWidget {
  const InfoAboutCaloric({
    super.key,
    required this.widget,
  });

  final CardPosition widget;

  @override
  Widget build(BuildContext context) {
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
              Text('${widget.positionsList[widget.index].caloric.toString()}г',
                  style: theme.textTheme.labelSmall),
              Text('ккал', style: theme.textTheme.labelSmall),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.positionsList[widget.index].proteins.toString()}г',
                  style: theme.textTheme.labelSmall),
              Text('белки', style: theme.textTheme.labelSmall),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.positionsList[widget.index].fats.toString()}г',
                  style: theme.textTheme.labelSmall),
              Text('жиры', style: theme.textTheme.labelSmall),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.positionsList[widget.index].carbs.toString()}г',
                  style: theme.textTheme.labelSmall),
              Text('углеводы', style: theme.textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
