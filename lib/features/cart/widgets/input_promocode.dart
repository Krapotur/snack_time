import 'package:flutter/material.dart';

class InputPromocode extends StatelessWidget {
  const InputPromocode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      sliver: SliverToBoxAdapter(
        child: TextButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(
                Color.fromARGB(255, 225, 225, 225)),
          ),
          onPressed: () {},
          child: const Text(
            'Ввести промокод',
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
