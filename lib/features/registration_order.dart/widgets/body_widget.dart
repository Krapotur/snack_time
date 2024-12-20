import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/reg_order_model.dart';
import 'package:snack_time/features/registration_order.dart/widgets/widgets.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    super.key,
  });

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegOrderModel>();
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
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AddressDeliveryForm(),
                    model.isFaster == true || model.isTime
                        ? const DropMenuChangePay()
                        : const SizedBox.shrink(),
                  ],
                )
              : const SizedBox.shrink(),
          model.isSelected[1] == true
              ? const SizedBox(height: 20)
              : const SizedBox.shrink(),
          const UserWidget(),
          const SizedBox(height: 10),
          model.isSelected[0] == true
              ? const DatePickerWidget()
              : const SizedBox.shrink(),
          model.dateTime.isNotEmpty
              ? const SizedBox(height: 10)
              : const SizedBox.shrink(),
          const CommentWidget(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
