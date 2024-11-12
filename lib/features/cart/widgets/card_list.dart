import 'package:flutter/material.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';
import 'package:snack_time/repositories/positions/model/position.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    super.key,
    required this.positions,
  });

  final List<Position> positions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 8.0),
              sliver: SliverList.separated(
                itemCount: positions.length,
                separatorBuilder: (context, i) => const SizedBox(height: 2),
                itemBuilder: (context, i) => Card(
                  color: const Color.fromARGB(255, 249, 249, 249),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                    child: CardOrder(positions: positions, index: i),
                  ),
                ),
              ),
            ),

            // const InfoAbotDelivery(),
          ],
        ),
      ),
    );
  }
}
