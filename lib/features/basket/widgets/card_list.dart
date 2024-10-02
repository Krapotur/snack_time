import 'package:flutter/material.dart';
import 'package:snack_time/features/basket/widgets/widgets.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    super.key,
  });

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
                itemCount: 1,
                separatorBuilder: (context, i) =>
                    const Divider(height: 0.5, thickness: 0.5),
                itemBuilder: (context, i) => Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: const CardOrder(),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(height: 0.5, thickness: 0.5),
            ),
            const InputPromocode(),
            // const InfoAbotDelivery(),
          ],
        ),
      ),
    );
  }
}
