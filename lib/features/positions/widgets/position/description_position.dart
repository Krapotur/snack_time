import 'package:flutter/material.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';
import 'package:snack_time/repositories/models.dart';

class DescriptionPosition extends StatelessWidget {
  const DescriptionPosition({
    super.key,
    required this.widget,
  });

  final CardPosition widget;

  @override
  Widget build(BuildContext context) {
    Position position = widget.positionsList[widget.index];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            position.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '${position.weight}г',
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
                position.composition,
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
