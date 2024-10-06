import 'package:flutter/material.dart';
import 'package:snack_time/repositories/models.dart';

class AppbarOrder extends StatelessWidget {
  const AppbarOrder({super.key, required this.positions});

  final List<Position> positions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(
              thickness: 2,
              indent: 130,
              endIndent: 130,
              color: Colors.grey,
            ),
            Text(
              '${positions.length} товар на ${_getSum(positions)} рублей',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              '"Оазис"',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  int _getSum(List<Position> positions) {
    int summ = 0;
    for (var position in positions) {
      summ += position.quantityInCart * position.price;
    }
    return summ;
  }
}
