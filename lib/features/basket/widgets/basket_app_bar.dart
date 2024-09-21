import 'package:flutter/material.dart';

class BasketAppBar extends StatelessWidget {
  const BasketAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const int num = 3;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      snap: true,
      floating: true,
      surfaceTintColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(num == 3 ? 50 : 120),
        child: Container(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '3 товара на 1800 рублей',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                '"Оазис"',
                style:
                    theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
