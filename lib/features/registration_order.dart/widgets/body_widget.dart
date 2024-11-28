import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/widgets/widgets.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<Model>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
          .copyWith(
              bottom: MediaQuery.of(context).viewInsets.bottom != 0 ? 100 : 0)
          .copyWith(bottom: 0),
      child: ListView(
        children: [
          const ToggleChangeMethodOrder(),
          const SizedBox(height: 10),
          model.isSelected[1] == true
              ? const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AddressDeliveryForm(),
                    DropMenuChangePay(),
                  ],
                )
              : const SizedBox.shrink(),
          const UserWidget(),
          const SizedBox(height: 20),
          const CommentWidget(),
          const SizedBox(height: 10),
          model.isSelected[1] == true
              ? const PromocodeWidget()
              : const SizedBox.shrink(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
