import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/repositories/models.dart';

class AppbarOrder extends StatelessWidget {
  const AppbarOrder({super.key, required this.positions});

  final List<Position> positions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, top: 10, right: 8, bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'Товары ${positions.length} на ${_getSum(positions)} рублей',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                '"Valencia R&K"',
                style:
                    theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
              ),
            ],
          ),
          GestureDetector(
            child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(Icons.close, color: Colors.white),
                )),
            onTap: () {
              AutoRouter.of(context).maybePop();
            },
          ),
        ],
      ),
    );
  }

  int _getSum(List<Position> positions) {
    int summ = 0;
    for (var position in positions) {
      summ += position.quantityInCart * position.price;
    }
    return summ;
  }
}
