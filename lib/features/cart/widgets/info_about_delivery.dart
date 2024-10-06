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
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Товаров: ${positions.length.toString()}'),
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
              Text('${_getSum(positions).toString()}руб.'),
              const Text('+10'),
              const Text('Бесплатно'),
            ],
          ),
        ],
      ),
    );

    // SliverToBoxAdapter(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 10.0)
    //         .copyWith(left: 30, right: 30),
    //     child: Container(
    //       height: 85,
    //       width: double.infinity,
    //       padding: const EdgeInsets.all(10),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey.withOpacity(0.5),
    //             spreadRadius: 1,
    //             blurRadius: 1,
    //             offset: const Offset(0, 0), // changes position of shadow
    //           ),
    //         ],
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Container(
    //             height: 80,
    //             width: 80,
    //             decoration: const BoxDecoration(
    //               image: DecorationImage(
    //                 image: AssetImage('assets/img/dostavka.png'),
    //               ),
    //             ),
    //           ),
    //           Text(
    //             'Доставка бесплатно',
    //             style: theme.textTheme.titleMedium,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  int _getSum(List<Position> positions) {
    int summ = 0;
    for (var position in positions) {
      summ += position.quantityInCart * position.price;
    }
    return summ;
  }
}
