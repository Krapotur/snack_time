import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/reg_order_model.dart';

class ToggleChangeMethodOrder extends StatelessWidget {
  const ToggleChangeMethodOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegOrderModel>();

    return Center(
      child: ToggleButtons(
        selectedColor: Colors.white,
        fillColor: Theme.of(context).primaryColor,
        constraints: const BoxConstraints.expand(height: 30, width: 100),
        isSelected: model.isSelected,
        children: const [Text('В ресторане'), Text('Доставка')],
        onPressed: (index) {
          for (var i = 0; i < model.isSelected.length; i++) {
            model.isSelected[i] = false;
          }
          model.setIsSelected(index);
        },
      ),
    );
  }
}
