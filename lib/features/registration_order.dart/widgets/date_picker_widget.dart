import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/reg_order_model.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegOrderModel>();
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.white)),
          onPressed: () => CupertinoRoundedDatePicker.show(
            use24hFormat: true,
            context,
            minimumDate: DateTime.now().add(const Duration(days: -1)),
            maximumDate: DateTime.now().add(const Duration(days: 5)),
            minuteInterval: 1,
            fontFamily: "Mali",
            textColor: Colors.white,
            background: theme.primaryColor,
            borderRadius: 16,
            initialDatePickerMode: CupertinoDatePickerMode.dateAndTime,
            onDateTimeChanged: (newDateTime) {
              String dateTime =
                  DateFormat('dd.MM.yyyy, kk:mm').format(newDateTime);

              if (dateTime.substring(12, 14) == '24') {
                String newDateTime = dateTime.replaceRange(12, 14, '00');
                model.setTime(newDateTime);
              } else {
                model.setTime(dateTime);
              }
            },
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month,
                color: theme.primaryColor,
              ),
              Text(model.dateTime.isEmpty ? 'Выбрать дату' : 'Изменить дату'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(model.dateTime.isEmpty ? '' : 'Вы выбрали на '),
            model.dateTime.isNotEmpty
                ? Text(
                    model.dateTime,
                    style: TextStyle(
                        color: theme.primaryColor, fontWeight: FontWeight.bold),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
