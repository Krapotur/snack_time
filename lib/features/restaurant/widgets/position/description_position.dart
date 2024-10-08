import 'package:flutter/material.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';

class DescriptionPosition extends StatelessWidget {
  const DescriptionPosition({
    super.key,
    required this.widget,
  });

  final CardPosition widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.positionsList[widget.index].title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '${widget.positionsList[widget.index].weight}г',
            style: TextStyle(fontSize: 13, color: Theme.of(context).hintColor),
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Состав:',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              Text(
                widget.positionsList[widget.index].composition,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 17),
          const Text(
            ' На 100г по открытым данным:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          InfoAboutCaloric(widget: widget),
        ],
      ),
    );
  }
}
