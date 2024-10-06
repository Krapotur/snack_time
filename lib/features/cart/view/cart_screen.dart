import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppbarOrder(),
        const Divider(height: 0.7, thickness: 0.7),
        const CardsList(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 5),
          decoration: const BoxDecoration(color: Colors.white),
          child: const Column(
            children: [
              InfoAbotDelivery(),
              Divider(height: 0.5, thickness: 0.5),
              BottomNavbar(),
            ],
          ),
        )
      ],
    );
  }
}
