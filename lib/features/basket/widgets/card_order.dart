import 'package:flutter/material.dart';
import 'package:snack_time/features/basket/widgets/widgets.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({
    super.key,
  });

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
                    image: const DecorationImage(
                        image: AssetImage('assets/img/shashlyk_baranina.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Шашлык из баранины',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '250 г',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
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
