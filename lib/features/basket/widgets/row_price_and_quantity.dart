import 'package:flutter/material.dart';

class RowPriceAndQuantity extends StatelessWidget {
  const RowPriceAndQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '600р',
            style: theme.textTheme.titleLarge,
          ),
          Container(
            height: 25,
            width: 70,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 227, 227, 227),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                ),
                Text('1'),
                Text(
                  '+',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
