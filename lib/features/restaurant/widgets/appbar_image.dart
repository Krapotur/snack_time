import 'package:auto_route/auto_route.dart';
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
      automaticallyImplyLeading: false,
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
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  url + imgSrc,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(left: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                onTap: () => AutoRouter.of(context).back()),
          ),
        ),
      ),
    );
  }
}
