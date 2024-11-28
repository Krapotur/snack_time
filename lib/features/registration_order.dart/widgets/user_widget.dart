import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/provider.dart';
import 'package:snack_time/ui/shared/widgets/base_textfield.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<Model>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(' Получатель:'),
        const SizedBox(height: 5),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                BaseTextfield(
                    textController: model.recipientController,
                    hintText: 'Фамилия, Имя',
                    height: 45,
                    maxLength: 30,
                    isNumber: false,
                    onTap: model.callNotifyListeners),
                const SizedBox(height: 10),
                BaseTextfield(
                    textController: model.phoneController,
                    hintText: 'Телефон без +7',
                    height: 45,
                    maxLength: 10,
                    isNumber: true,
                    onTap: model.callNotifyListeners),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
