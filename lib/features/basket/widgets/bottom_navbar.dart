import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(theme.primaryColor),
        ),
        onPressed: () {},
        child: const Text(
          'Оформить заказ',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
