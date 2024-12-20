import 'package:flutter/material.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';
import 'package:snack_time/features/registration_order.dart/widgets/widgets.dart';
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
        padding: const EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(color: Colors.white),
        child: CustomScrollView(
          slivers: [
            SliverList.separated(
              itemCount: positions.length,
              separatorBuilder: (context, i) => const SizedBox(height: 2),
              itemBuilder: (context, i) => Card(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 10),
                  child: CardOrder(positions: positions, index: i),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 2)),
            const SliverToBoxAdapter(
              child: PromocodeWidget(),
            )
          ],
        ),
      ),
    );
  }
}
