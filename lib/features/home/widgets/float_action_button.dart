import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snack_time/features/basket/basket.dart';

class FloatActionButton extends StatelessWidget {
  const FloatActionButton({
    super.key,
  });

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
            '1',
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
          child: BasketScreen(),
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
}
