import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/reg_order_model.dart';

class AddressDeliveryInfo extends StatelessWidget {
  const AddressDeliveryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final model = context.watch<RegOrderModel>();

    String street = model.streetController.text;
    String city = model.cityController.text;

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
          onPressed: () => model.setIsEdit(),
        )
      ],
    );
  }
}
