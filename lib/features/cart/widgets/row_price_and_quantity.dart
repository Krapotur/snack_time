import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/cart/bloc/cart_bloc.dart';
import 'package:snack_time/repositories/positions/model/position.dart';

class RowPriceAndQuantity extends StatelessWidget {
  const RowPriceAndQuantity({
    super.key,
    required this.positions,
    required this.index,
  });

  final List<Position> positions;
  final int index;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Position position = positions[index];
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${position.price.toString()} руб',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 227, 227, 227),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadiusDirectional.circular(30)),
                        child: const Icon(
                          Icons.remove_outlined,
                          color: Colors.white,
                          size: 17,
                        )),
                    onTap: () {
                      BlocProvider.of<CartBloc>(context)
                          .add(RemovePositionCartEvent(position: position));
                    }),
                Text(
                  position.quantityInCart > 0
                      ? position.quantityInCart.toString()
                      : '1',
                  style: const TextStyle(fontSize: 16),
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return GestureDetector(
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(30)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 17,
                            )),
                        onTap: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(AddPositionCartEvent(position: position));
                        });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
