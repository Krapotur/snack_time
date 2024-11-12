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
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                positions[index].price.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const Icon(
                Icons.currency_ruble,
                size: 17,
                color: Colors.black,
              )
            ],
          ),
          Container(
            height: 35,
            width: 95,
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
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadiusDirectional.circular(30)),
                        child: const Icon(
                          Icons.remove_outlined,
                          color: Colors.white,
                          size: 20,
                        )),
                    onTap: () {
                      BlocProvider.of<CartBloc>(context).add(
                          RemovePositionCartEvent(position: positions[index]));
                    }),
                Text(
                  positions[index].quantityInCart > 0
                      ? positions[index].quantityInCart.toString()
                      : '1',
                  style: const TextStyle(fontSize: 16),
                ),
                GestureDetector(
                    child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadiusDirectional.circular(30)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        )),
                    onTap: () {
                      BlocProvider.of<CartBloc>(context).add(
                          AddPositionCartEvent(position: positions[index]));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
