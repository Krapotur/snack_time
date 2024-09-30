import 'package:flutter/material.dart';

class RestaurantImage extends StatelessWidget {
  final String imgSrc;
  const RestaurantImage({super.key, required this.imgSrc});

  @override
  Widget build(BuildContext context) {
    String url = 'http://10.101.11.31:5000/';

    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(url + imgSrc), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
