import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';
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
  bool isRestaurant = false;
  bool isDelivery = false;
  List<bool> isSelected = [true, false];
  bool isFaster = false;
  bool isTime = false;
  bool isEdit = true;

  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Оформление заказа',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        backgroundColor: theme.primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Center(
              child: ToggleButtons(
                selectedColor: Colors.white,
                fillColor: theme.primaryColor,
                constraints:
                    const BoxConstraints.expand(height: 30, width: 100),
                isSelected: isSelected,
                children: const [Text('В ресторане'), Text('Доставка')],
                onPressed: (index) {
                  setState(() {
                    for (var i = 0; i < isSelected.length; i++) {
                      isSelected[i] = false;
                    }
                    isSelected[index] = !isSelected[index];
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            isRestaurant == true
                ? const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [])
                : const SizedBox.shrink(),
            isSelected[1] == true
                ? Column(
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
                              isEdit
                                  ? Column(
                                      children: [
                                        DropMenuCities(
                                            cityController: _cityController,
                                            onTap: _callSetState),
                                        const SizedBox(height: 10),
                                        _cityController.text.isNotEmpty
                                            ? BaseTextfield(
                                                textController:
                                                    _streetController,
                                                hintText:
                                                    'Улица, дом, квартира',
                                                height: 45,
                                                maxLength: 40,
                                                isNumber: false,
                                                onTap: _callSetState,
                                              )
                                            : const SizedBox.shrink(),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(height: 5),
                              _cityController.text.isNotEmpty &&
                                      _streetController.text.isNotEmpty
                                  ? AdressDeliveryInfo(
                                      city: _cityController.text,
                                      street: _streetController.text,
                                      onEdit: _setIsEdit,
                                    )
                                  : const SizedBox.shrink(),
                              _streetController.text.isNotEmpty &&
                                      _cityController.text.isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                        const Divider(height: 3),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Когда доставить?',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height: 35,
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                    value: isFaster,
                                                    activeColor:
                                                        theme.primaryColor,
                                                    onChanged: (newBool) {
                                                      setState(() {
                                                        if (isFaster == true) {
                                                          isFaster = false;
                                                        } else {
                                                          isEdit = false;
                                                          isFaster = true;
                                                          isTime = false;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  GestureDetector(
                                                    child: const Text(
                                                        'Как можно скорее'),
                                                    onTap: () => setState(
                                                      () {
                                                        if (isFaster == true) {
                                                          isFaster = false;
                                                        } else {
                                                          isEdit = false;
                                                          isFaster = true;
                                                          isTime = false;
                                                        }
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 35,
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                      value: isTime,
                                                      activeColor:
                                                          theme.primaryColor,
                                                      onChanged: (newBool) {
                                                        setState(() {
                                                          if (isTime == true) {
                                                            isTime = false;
                                                          } else {
                                                            isEdit = false;
                                                            isFaster = false;
                                                            isTime = true;
                                                          }
                                                        });
                                                      }),
                                                  GestureDetector(
                                                    child: const Text(
                                                        'Ко времени'),
                                                    onTap: () => setState(
                                                      () {
                                                        if (isTime == true) {
                                                          isTime = false;
                                                        } else {
                                                          isEdit = false;
                                                          isFaster = false;
                                                          isTime = true;
                                                        }
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 20),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(' Комментарий к заказу:'),
                const SizedBox(height: 3),
                Card(
                  child: BaseTextfield(
                      textController: _commentController,
                      hintText: '',
                      height: 100,
                      maxLength: 150,
                      isNumber: false,
                      onTap: _callSetState),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: InfoAbotDelivery(positions: widget.positions),
    );
  }

  void _callSetState() {
    setState(() {});
  }

  void _setIsEdit() {
    setState(() {
      isEdit = true;
    });
  }
}
