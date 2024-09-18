import 'package:flutter/material.dart';

class IconArrowBack extends StatelessWidget {
  const IconArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/'),
          child: Container(
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            child: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
