import 'package:flutter/material.dart';
import 'package:snack_time/repositories/positions/model/position.dart';

class RowPriceAndQuantity extends StatelessWidget {
  const RowPriceAndQuantity({
    super.key,
    required this.positions,
    required this.index,
  });

  final List<Position> positions;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            positions[index].price.toString(),
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Container(
            height: 25,
            width: 70,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 227, 227, 227),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.remove_outlined),
                Text(
                  positions[index].quantityInCart > 0
                      ? positions[index].quantityInCart.toString()
                      : '1',
                ),
                const Icon(Icons.add),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
