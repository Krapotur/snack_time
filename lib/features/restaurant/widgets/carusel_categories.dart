import 'package:flutter/material.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';

class CaruselCategories extends StatelessWidget {
  const CaruselCategories({
    super.key,
    required List<String> categories,
    required this.categoryTitle,
  }) : _categories = categories;

  final List<String> _categories;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
            vertical: BorderSide(
              width: 2,
              color: Color.fromARGB(255, 211, 210, 210),
              style: BorderStyle.solid,
            ),
          )),
      child: SizedBox(
        height: 50,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // setState(
                        //     () => categoryTitle = _categories[index]);
                      },
                      child: TitleCategory(
                        categories: _categories,
                        categoryTitle: categoryTitle,
                        index: index,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
