import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';
import 'package:snack_time/features/registration_order.dart/provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/widgets/widgets.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/ui/shared/widgets/base_textfield.dart';

@RoutePage()
class RegistrationOrderScreen extends StatefulWidget {
  const RegistrationOrderScreen({super.key, required this.positions});

  final List<Position> positions;

  @override
  State<RegistrationOrderScreen> createState() =>
      _RegistrationOrderScreenState();
}

class _RegistrationOrderScreenState extends State<RegistrationOrderScreen> {
  List<bool> isSelected = [true, false];
  bool isRestaurant = false;
  bool isDelivery = false;
  bool isActiveKeyboard = false;

  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController promocodeController = TextEditingController();

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
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                .copyWith(
                    bottom:
                        MediaQuery.of(context).viewInsets.bottom != 0 ? 100 : 0)
                .copyWith(bottom: 0),
            child: ListView(
              children: [
                Center(
                  child: ToggleButtons(
                    selectedColor: Colors.white,
                    fillColor: Theme.of(context).primaryColor,
                    constraints:
                        const BoxConstraints.expand(height: 30, width: 100),
                    isSelected: isSelected,
                    children: const [Text('В ресторане'), Text('Доставка')],
                    onPressed: (index) {
                      for (var i = 0; i < isSelected.length; i++) {
                        isSelected[i] = false;
                      }
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                isSelected[1] == true
                    ? const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [AddressDeliveryForm(), DropMenuChangePay()],
                      )
                    : const SizedBox.shrink(),
                Column(
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
                                textController: _recipientController,
                                hintText: 'Фамилия, Имя',
                                height: 45,
                                maxLength: 30,
                                isNumber: false,
                                onTap: _callSetState),
                            const SizedBox(height: 10),
                            BaseTextfield(
                                textController: _phoneController,
                                hintText: 'Телефон без +7',
                                height: 45,
                                maxLength: 10,
                                isNumber: true,
                                onTap: _callSetState),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const CommentCardWidget(),
                const SizedBox(height: 10),
                const PromocodeWidget(),
                const SizedBox(height: 30),
              ],
            ),
          ),
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

void _callSetState() {}
