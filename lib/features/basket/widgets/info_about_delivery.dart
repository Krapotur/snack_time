import 'package:flutter/material.dart';

class InfoAbotDelivery extends StatelessWidget {
  const InfoAbotDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('3 товара'),
              Text('Бонусы'),
              Text('Доставка'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('1800 Р'),
              Text('+25'),
              Text('Бесплатно'),
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
}
