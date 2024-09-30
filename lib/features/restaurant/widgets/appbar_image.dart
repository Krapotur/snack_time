import 'package:flutter/material.dart';

class AppBarImage extends StatelessWidget {
  const AppBarImage({
    super.key,
    required this.url,
    required this.imgSrc,
  });

  final String url;
  final String imgSrc;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      pinned: false,
      floating: false,
      expandedHeight: 180,
      flexibleSpace: FlexibleSpaceBar(
        background: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: <Color>[Colors.white, Colors.transparent],
            ),
          ),
          child: Image.network(
            url + imgSrc,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
