import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/provider.dart';
import 'package:snack_time/ui/shared/widgets/base_textfield.dart';

class DropMenuChangePay extends StatelessWidget {
  const DropMenuChangePay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<Model>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(' Оплата:'),
        const SizedBox(height: 5),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownMenu(
                  expandedInsets: const EdgeInsets.all(2),
                  label: const Text('Способ оплаты',
                      style: TextStyle(fontSize: 15)),
                  controller: model.payController,
                  menuHeight: 200,
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 220, 220)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(value: 'cash', label: 'Наличными'),
                    DropdownMenuEntry(value: 'pay', label: 'По карте'),
                  ],
                  onSelected: (value) =>
                      model.setDescrtiptionText(value as String),
                ),
                SizedBox(
                  height: model.payController.text == 'Наличными' ? 10 : 0,
                ),
                model.payController.text == 'Наличными'
                    ? BaseTextfield(
                        textController: model.changeFromAmountController,
                        hintText: 'Укажите сумму',
                        height: 45,
                        maxLength: 6,
                        isNumber: true,
                        onTap: model.callNotifyListeners)
                    : const SizedBox.shrink(),
                model.descriptionPay.isNotEmpty
                    ? Flexible(
                        child: Text(
                          model.descriptionPay,
                          style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).primaryColor),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
