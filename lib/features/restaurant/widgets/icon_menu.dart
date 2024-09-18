import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  const IconMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10.0, right: 7),
      child: Icon(
        Icons.menu,
        size: 35,
        color: Colors.grey,
      ),
    );
  }
}
