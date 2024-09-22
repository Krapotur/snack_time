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
    return Column(
      children: [
        const AppbarOrder(),
        const CardsList(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 5),
          decoration: const BoxDecoration(color: Colors.white),
          child: const Column(
            children: [
              InfoAbotDelivery(),
              BottomNavbar(),
            ],
          ),
        )
      ],
    );
  }
}
