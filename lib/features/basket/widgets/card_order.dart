import 'package:flutter/material.dart';
import 'package:snack_time/features/basket/widgets/widgets.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                    image: const DecorationImage(
                        image: AssetImage('assets/img/plov.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Плов',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      '180 г',
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const RowPriceAndQuantity(),
      ],
    );
  }
}
