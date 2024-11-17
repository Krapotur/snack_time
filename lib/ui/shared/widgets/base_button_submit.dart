import 'package:flutter/material.dart';
import 'package:snack_time/repositories/models.dart';

class BaseButtonSubmit extends StatelessWidget {
  const BaseButtonSubmit({
    super.key,
    required this.positions,
    required this.title,
  });
  final List<Position> positions;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 35,
      width: (MediaQuery.of(context).size.width / 2) - 20,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadiusDirectional.circular(30)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
