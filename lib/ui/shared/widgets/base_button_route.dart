import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BaseButtonRoute extends StatelessWidget {
  const BaseButtonRoute(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.route});

  final String title;
  final String subTitle;
  final PageRouteInfo route;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: GestureDetector(
        onTap: () => AutoRouter.of(context).push(route),
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title),
                    subTitle.isNotEmpty
                        ? Text(
                            subTitle,
                            style: theme.textTheme.labelSmall
                                
                          )
                        : SizedBox.shrink(),
                  ],
                ),
                Icon(
                  Icons.arrow_right,
                  color: Colors.grey,
                ),
              ],
            )),
      ),
    );
  }
}
