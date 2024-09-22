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
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              sliver: SliverList.separated(
                itemCount: 3,
                separatorBuilder: (context, i) => const Divider(),
                itemBuilder: (context, i) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const CardOrder(),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: Divider()),
            const InputPromocode(),
            // const InfoAbotDelivery(),
          ],
        ),
      ),
    );
  }
}
