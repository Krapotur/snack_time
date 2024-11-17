import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/cart/bloc/cart_bloc.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';
import 'package:snack_time/repositories/models.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List<Position> positions = state.cartPositions;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Корзина',
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: theme.primaryColor,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  ' Товары ${positions.length} на ${_getSum(positions)} рублей',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CardsList(positions: state.cartPositions),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Divider(
                        height: 0.7,
                        thickness: 0.7,
                        color: theme.primaryColor,
                      ),
                      ButtonSubmit(positions: positions),
                      InfoAbotDelivery(positions: state.cartPositions),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
