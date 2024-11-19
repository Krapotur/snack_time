import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/cart/bloc/cart_bloc.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';
import 'package:snack_time/repositories/models.dart';

class ButtonAddCart extends StatelessWidget {
  const ButtonAddCart({
    super.key,
    required this.widget,
  });

  final CardPosition widget;

  @override
  Widget build(BuildContext context) {
    Position position = widget.positionsList[widget.index];
    final theme = Theme.of(context);
    return BottomAppBar(
      height: 70,
      color: Colors.white,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return GestureDetector(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  'В корзину за ${position.price} руб.',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
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
    );
  }
}
