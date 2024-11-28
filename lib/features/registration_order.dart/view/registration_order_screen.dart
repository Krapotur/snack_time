import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';
import 'package:snack_time/features/registration_order.dart/provider/provider.dart';
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
        create: (context) => Model(),
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
