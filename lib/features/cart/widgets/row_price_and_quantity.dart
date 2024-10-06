import 'package:flutter/material.dart';

class RowPriceAndQuantity extends StatelessWidget {
  const RowPriceAndQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '650',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
                Icon(Icons.remove_outlined),
                Text('1'),
                Icon(Icons.add),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
