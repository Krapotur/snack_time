import 'package:flutter/material.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';
import 'package:snack_time/repositories/api_url.dart';
import 'package:snack_time/repositories/positions/model/position.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({
    super.key,
    required this.positions,
    required this.index,
  });
  final List<Position> positions;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(apiUrl + positions[index].imgSrc),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      positions[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${positions[index].weight} г',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        RowPriceAndQuantity(positions: positions, index: index),
      ],
    );
  }
}
