import 'package:flutter/material.dart';
import 'package:snack_time/repositories/models.dart';

class AppbarOrder extends StatelessWidget {
  const AppbarOrder({super.key, required this.positions});

  final List<Position> positions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Товары ${positions.length} на ${_getSum(positions)} рублей',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          '"Italiano R&K"',
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
        ),
      ],
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
