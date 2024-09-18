import 'package:flutter/material.dart';

class TitleCategory extends StatelessWidget {
  final int index;
  const TitleCategory({
    super.key,
    required List<String> categories,
    required this.categoryTitle,
    required this.index,
  }) : _categories = categories;

  final List<String> _categories;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      _categories[index],
      style: TextStyle(
          color: categoryTitle == _categories[index]
              ? const Color.fromARGB(255, 250, 134, 1)
              : Colors.grey,
          fontFamily: 'Lora',
          fontWeight: categoryTitle == _categories[index]
              ? FontWeight.bold
              : FontWeight.normal),
    );
  }
}
