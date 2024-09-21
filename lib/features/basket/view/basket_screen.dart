import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/features/basket/widgets/widgets.dart';

@RoutePage()
class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const BasketAppBar(),
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

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
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
            ),
          )
          // const InfoAbotDelivery(),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
