import 'package:flutter/material.dart';

class AdressDeliveryInfo extends StatelessWidget {
  const AdressDeliveryInfo({
    super.key,
    required this.city,
    required this.street,
    required this.onEdit,
  });

  final String city;
  final String street;
  final void Function() onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
                color: theme.primaryColor,
              ),
              const Text('Адрес: '),
              Flexible(
                child: Text(
                  '$city, ул. $street',
                  style: TextStyle(
                      color: theme.primaryColor, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(
            Icons.edit_note,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () => onEdit(),
        )
      ],
    );
  }
}
