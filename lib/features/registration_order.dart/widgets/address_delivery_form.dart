import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/widgets/widgets.dart';
import 'package:snack_time/ui/shared/widgets/widgets.dart';

class AddressDeliveryForm extends StatefulWidget {
  const AddressDeliveryForm({
    super.key,
  });

  @override
  State<AddressDeliveryForm> createState() => _AddressDeliveryFormState();
}

class _AddressDeliveryFormState extends State<AddressDeliveryForm> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<Model>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(' Адрес доставки:'),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                model.isEdit == true
                    ? Column(
                        children: [
                          const DropMenuCities(),
                          const SizedBox(height: 10),
                          model.cityController.text.isNotEmpty
                              ? BaseTextfield(
                                  textController: model.streetController,
                                  hintText: 'Улица, дом, квартира',
                                  height: 45,
                                  maxLength: 40,
                                  isNumber: false,
                                  onTap: () => model.setIsEdit(),
                                )
                              : const SizedBox.shrink(),
                        ],
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 5),
                model.cityController.text.isNotEmpty &&
                        model.streetController.text.isNotEmpty
                    ? const AddressDeliveryInfo()
                    : const SizedBox.shrink(),
                model.streetController.text.isNotEmpty &&
                        model.cityController.text.isNotEmpty
                    ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Divider(height: 3),
                          SizedBox(height: 10),
                          Text(
                            'Когда доставить?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ChexboxDeliveryChange(),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
