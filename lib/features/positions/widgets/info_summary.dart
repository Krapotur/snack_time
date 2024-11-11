import 'package:flutter/material.dart';

class InfoSummary extends StatelessWidget {
  final String? kitchenTitle;

  const InfoSummary({super.key, this.kitchenTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Italiano',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 22,
                width: 52,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        '5.0',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          '$kitchenTitle кухня',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Row(
          children: [
            Icon(
              Icons.access_time,
              size: 17,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(width: 2),
            Text(
              'Часы работы: 10:00 - 23:00',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
