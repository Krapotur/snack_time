import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 70,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 25,
                ),
                Text(
                  'Рестораны',
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.shopping_basket,
                  size: 27,
                  color: Colors.grey,
                ),
                Text(
                  'Корзина',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.manage_accounts,
                  size: 27,
                  color: Colors.grey,
                ),
                Text(
                  'Профиль',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
