import 'package:flutter/material.dart';
import 'package:snack_time/repositories/positions/model/position.dart';

class InfoAbotDelivery extends StatelessWidget {
  const InfoAbotDelivery({
    super.key,
    required this.positions,
  });

  final List<Position> positions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Товаров: ${_getQuantityPositions(positions).toString()}'),
                  const Text('Бонусы'),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Доставка'),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.directions_run,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${_getSum(positions).toString()} руб.'),
                  Text(
                      '${(_getSum(positions) / 100 * 10).ceil().toString()} руб.'),
                  Text(_getSum(positions) < 1000 ? '300 руб.' : 'Бесплатно'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          _getSum(positions) < 1000
              ? Text(
                  '(для бесплатной доставки не хватает: ${1000 - _getSum(positions)} руб)',
                  style: TextStyle(
                      fontSize: 13, color: Theme.of(context).primaryColor))
              : const SizedBox.shrink()
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

  int _getQuantityPositions(List<Position> positions) {
    int summ = 0;

    for (var position in positions) {
      summ += position.quantityInCart;
    }

    return summ;
  }
}
