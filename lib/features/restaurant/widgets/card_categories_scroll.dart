import 'package:flutter/material.dart';

class CardCategoriesScroll extends StatefulWidget {
  final List<String>? categories;
  final Function? setState;

  const CardCategoriesScroll({super.key, this.categories, this.setState});

  @override
  State<CardCategoriesScroll> createState() => _CardCategoriesScrollState();
}

class _CardCategoriesScrollState extends State<CardCategoriesScroll> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String categoryTitle = '';

    return Card(
      surfaceTintColor: Colors.white,
      child: SizedBox(
        height: 50,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.menu,
                size: 35,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45.0, right: 5.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categories?.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          categoryTitle = widget.categories![index];
                        });
                        widget.setState;
                      },
                      child: Text(
                        widget.categories![index],
                        style: TextStyle(
                            color: categoryTitle == widget.categories![index]
                                ? const Color.fromARGB(255, 250, 134, 1)
                                : Colors.grey,
                            fontFamily: 'Lora',
                            fontWeight:
                                categoryTitle == widget.categories![index]
                                    ? FontWeight.bold
                                    : FontWeight.normal),
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
