import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/provider.dart';

class ChexboxDeliveryChange extends StatelessWidget {
  const ChexboxDeliveryChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final model = context.watch<Model>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 35,
          child: Row(
            children: [
              Checkbox(
                value: model.isFaster,
                activeColor: theme.primaryColor,
                onChanged: (_) => model.onBySoon(),
              ),
              GestureDetector(
                child: const Text('Как можно скорее'),
                onTap: () => model.onBySoon(),
              )
            ],
          ),
        ),
        SizedBox(
          height: 35,
          child: Row(
            children: [
              Checkbox(
                value: model.isTime,
                activeColor: theme.primaryColor,
                onChanged: (_) => model.onByTime(),
              ),
              GestureDetector(
                child: const Text('Ко времени'),
                onTap: () => model.onByTime(),
              )
            ],
          ),
        )
      ],
    );
  }
}
