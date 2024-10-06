import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/cart/bloc/cart_bloc.dart';
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
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            AppbarOrder(positions: state.cartPositions),
            const Divider(height: 0.7, thickness: 0.7),
            CardsList(positions: state.cartPositions),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 5),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  InfoAbotDelivery(positions: state.cartPositions),
                  const Divider(height: 0.5, thickness: 0.5),
                  const BottomNavbar(),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
