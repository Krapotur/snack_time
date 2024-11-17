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
    Position position = positions[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(apiUrl + position.imgSrc),
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
                      position.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '${position.weight}г',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
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
