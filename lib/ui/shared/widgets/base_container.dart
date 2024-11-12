import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    required this.color,
  });
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(10.0).copyWith(bottom: 5),
        child: child);
  }
}
