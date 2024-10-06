import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snack_time/features/cart/cart.dart';
import 'package:snack_time/repositories/models.dart';

class FloatActionButton extends StatelessWidget {
  const FloatActionButton({
    super.key,
    required this.positions,
  });

  final List<Position> positions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Badge(
          largeSize: 2,
          label: Text(
            positions.length.toString(),
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 15),
          ),
          backgroundColor: Colors.white,
          child: const FaIcon(
            FontAwesomeIcons.basketShopping,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: CartScreen(),
        ),
      ),
    );

    // TextButton(
    //   style: ButtonStyle(
    //       backgroundColor:
    //           WidgetStatePropertyAll<Color>(Theme.of(context).primaryColor)),
    //   onPressed: () => {
    //     showModalBottomSheet(
    //       isScrollControlled: true,
    //       backgroundColor: Colors.transparent,
    //       context: context,
    //       builder: (context) => const Padding(
    //         padding: EdgeInsets.only(top: 60.0),
    //         child: BasketScreen(),
    //       ),
    //     ),
    //   },
    //   child: const Text(
    //     'Корзина(3)',
    //     style: TextStyle(color: Colors.white),
    //   ),
    // );
  }

  int _getQuantityPositions(List<Position> positions) {
    int summ = 0;

    for (var position in positions) {
      summ += position.quantityInCart;
    }

    return summ;
  }
}
