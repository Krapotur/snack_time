import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/cart/bloc/cart_bloc.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';

class ButtonAddCart extends StatelessWidget {
  const ButtonAddCart({
    super.key,
    required this.widget,
  });

  final CardPosition widget;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: Colors.white,
      child: GestureDetector(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              'В корзину за ${widget.positionsList[widget.index].price} руб.',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          BlocProvider.of<CartBloc>(context).add(AddPositionCartEvent(
              position: widget.positionsList[widget.index]));
          AutoRouter.of(context).maybePop();
        },
      ),
    );
  }
}
