import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';
import 'package:snack_time/features/registration_order.dart/provider/reg_order_model.dart';
import 'package:snack_time/features/registration_order.dart/widgets/widgets.dart';
import 'package:snack_time/repositories/models.dart';

@RoutePage()
class RegistrationOrderScreen extends StatefulWidget {
  const RegistrationOrderScreen({super.key, required this.positions});

  final List<Position> positions;

  @override
  State<RegistrationOrderScreen> createState() =>
      _RegistrationOrderScreenState();
}

class _RegistrationOrderScreenState extends State<RegistrationOrderScreen> {
  bool isRestaurant = false;
  bool isDelivery = false;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => RegOrderModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Оформление заказа',
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: const BodyWidget(),
          bottomNavigationBar: InfoAbotDelivery(positions: widget.positions),
          floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
              ? GestureDetector(
                  child: BaseButtonSubmit(
                      title: 'Заказать', positions: widget.positions),
                  onTap: () => AutoRouter.of(context).back(),
                )
              : const SizedBox.shrink(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      );
}

// void getTime() {
//   String startTime = '10:00';
//   String endTime = '24:00';

//   int hourStart = int.parse(startTime.substring(0, 2));
//   int minStart = int.parse(startTime.substring(3, 5));
//   int hourEnd = int.parse(endTime.substring(0, 2));
//   String min = '00';
//   String minRange = '30';

//   List<String> timeList = [];
//   int count = 0;
//   for (var time = hourStart;
//       time < hourEnd;
//       int.parse(minRange) == 30 ? time++ : time += 0) {
//     String newTime = '$time:$min - $time:$minRange';
//     if (count == 3) {
//       count = 0;
//     }
//     if (min == '30') {
//       min = '00';
//       minRange = '30';
//     } else {
//       min = '30';
//       minRange = '00';
//     }
//     count++;
//     log(newTime);
//   }
// }
