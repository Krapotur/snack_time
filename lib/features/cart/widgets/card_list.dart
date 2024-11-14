import 'package:auto_route/auto_route.dart';
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
    TextEditingController promocodeController = TextEditingController();

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(bottom: 5),
        decoration: const BoxDecoration(color: Colors.white),
        child: CustomScrollView(
          slivers: [
            SliverList.separated(
              itemCount: positions.length,
              separatorBuilder: (context, i) => const SizedBox(height: 2),
              itemBuilder: (context, i) => Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 10),
                  child: CardOrder(positions: positions, index: i),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 2)),
            positions.isNotEmpty
                ? SliverToBoxAdapter(
                    child: GestureDetector(
                      child: Text(
                        'У меня есть промокод!',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => _showDialog(context, promocodeController),
                    ),
                  )
                : const SliverToBoxAdapter(child: SizedBox.shrink()),
            // const InfoAbotDelivery(),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, TextEditingController controller) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        content: Stack(alignment: Alignment.topRight, children: [
          InputPromocode(controller: controller),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(Icons.close, size: 15, color: Colors.white),
            ),
            onTap: () {
              AutoRouter.of(context).maybePop();
            },
          ),
        ]),
      ),
    );
  }
}
