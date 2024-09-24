import 'package:flutter/material.dart';
import 'package:snack_time/features/basket/basket.dart';

class FloatActionButton extends StatelessWidget {
  const FloatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll<Color>(Theme.of(context).primaryColor)),
      onPressed: () => {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: BasketScreen(),
          ),
        ),
      },
      child: const Text(
        'Корзина(3)',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
