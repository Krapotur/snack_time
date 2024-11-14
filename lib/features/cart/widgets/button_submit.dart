import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      child: Container(
        height: 35,
        width: MediaQuery.of(context).size.width / 2,
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadiusDirectional.circular(30)),
        child: const Center(
          child: Text(
            'Оформить заказ',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
      onTap: () => {},
    );
  }
}
