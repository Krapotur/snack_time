import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';

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
              'В корзину за ${widget.positionsList[widget.index].price}руб.',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        onTap: () => AutoRouter.of(context).maybePop(),
      ),
    );
  }
}
