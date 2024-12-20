import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/reg_order_model.dart';

class ChexboxDeliveryChange extends StatefulWidget {
  const ChexboxDeliveryChange({
    super.key,
  });

  @override
  State<ChexboxDeliveryChange> createState() => _ChexboxDeliveryChangeState();
}

class _ChexboxDeliveryChangeState extends State<ChexboxDeliveryChange> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final model = context.watch<RegOrderModel>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 35,
          child: Row(
            children: [
              Checkbox(
                value: model.isFaster,
                shape: const CircleBorder(),
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
                shape: const CircleBorder(),
                activeColor: theme.primaryColor,
                onChanged: (_) => model.onByTime(),
              ),
              GestureDetector(
                child: const Text('Ко времени'),
                onTap: () => model.onByTime(),
              )
            ],
          ),
        ),
        model.isTime == true
            ? SizedBox(
                height: 60,
                child: CarouselView(
                  shrinkExtent: 100,
                  itemExtent: 150,
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(
                    model.timeList.length,
                    (int index) {
                      return Container(
                        color: model.selectedTime == model.timeList[index]
                            ? theme.primaryColor
                            : theme.highlightColor,
                        child: Center(
                          child: Text(
                            model.timeList[index],
                            style: TextStyle(
                              color: model.selectedTime == model.timeList[index]
                                  ? theme.highlightColor
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  onTap: (time) => model.setSelectTime(time),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
