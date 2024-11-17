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
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 227, 227, 227),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 4),
                        padding: const EdgeInsets.all(4),
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
                          margin: const EdgeInsets.symmetric(horizontal: 7),
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
                        int summQuantityorders = 0;
                        for (var x in state.cartPositions) {
                          summQuantityorders += x.quantityInCart;
                        }
                        if (summQuantityorders >= 20) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color.fromARGB(255, 173, 62, 62),
                              duration: Duration(seconds: 5),
                              content: Text(
                                'Корзина переполнена!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } else if (position.quantityInCart >= 5) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color.fromARGB(255, 173, 62, 62),
                              duration: Duration(seconds: 5),
                              content: Text(
                                'Количество заказов ограничено. \nЕсли требуется больше, сделайте дополнительный заказ или позвоните в ресторан по телефону: +7 905 456 24 54',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              dismissDirection: DismissDirection.endToStart,
                              backgroundColor: theme.primaryColor,
                              duration: const Duration(seconds: 1),
                              content: Text(
                                '${position.title} добавлен(а) в корзину',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                          BlocProvider.of<CartBloc>(context)
                              .add(AddPositionCartEvent(position: position));
                        }
                      },
                    );
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
