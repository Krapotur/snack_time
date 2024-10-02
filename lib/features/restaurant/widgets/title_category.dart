import 'package:flutter/material.dart';

class TitleCategory extends StatelessWidget {
  const TitleCategory({
    super.key,
    required this.categories,
    required this.categoryTitle,
    required this.index,
  });

  final int index;
  final List<String> categories;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(
          categoryTitle == categories[index]
              ? Theme.of(context).primaryColor
              : Theme.of(context).hintColor,
        ),
      ),
      onPressed: () {
        // setState(() {
        //   title = kitchen.title;
        // });
      },
      child: Text(
        categories[index],
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
