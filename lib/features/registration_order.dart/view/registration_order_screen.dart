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
  bool? isRestaurant = false;
  bool? isDelivery = false;
  bool? isFaster = true;
  bool? isTime = false;
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            const Text(' Информация о доставке'),
            Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 35,
                      child: Row(
                        children: [
                          Checkbox(
                            value: isRestaurant,
                            activeColor: theme.primaryColor,
                            onChanged: (newBool) {
                              setState(
                                () {
                                  if (isRestaurant == true) {
                                    isRestaurant = false;
                                  } else {
                                    isRestaurant = true;
                                    isDelivery = false;
                                  }
                                },
                              );
                            },
                          ),
                          GestureDetector(
                            child: const Text('В ресторане'),
                            onTap: () => setState(
                              () {
                                if (isRestaurant == true) {
                                  isRestaurant = false;
                                } else {
                                  isRestaurant = true;
                                  isDelivery = false;
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
                              value: isDelivery,
                              activeColor: theme.primaryColor,
                              onChanged: (newBool) {
                                setState(() {
                                  if (isDelivery == true) {
                                    isDelivery = false;
                                  } else {
                                    isDelivery = true;
                                    isRestaurant = false;
                                  }
                                });
                              }),
                          GestureDetector(
                            child: const Text('Доставить по адресу'),
                            onTap: () => setState(
                              () {
                                if (isDelivery == true) {
                                  isDelivery = false;
                                } else {
                                  isDelivery = true;
                                  isRestaurant = false;
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            isRestaurant == true
                ? const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [])
                : const SizedBox.shrink(),
            isDelivery == true
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(' Адрес доставки'),
                      Card(
                        surfaceTintColor: Colors.white,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DropMenuCities(
                                  cityController: _cityController,
                                  onTap: _callSetState),
                              const SizedBox(height: 10),
                              _cityController.text.isNotEmpty
                                  ? BaseTextfield(
                                      textController: _streetController,
                                      hintText: 'Улица, дом, квартира',
                                      onTap: _callSetState,
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(height: 5),
                              _cityController.text.isNotEmpty &&
                                      _streetController.text.isNotEmpty
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 20,
                                          color: theme.primaryColor,
                                        ),
                                        const Text('Адрес: '),
                                        Flexible(
                                          child: Text(
                                            '${_cityController.text}, ул. ${_streetController.text}',
                                            style: TextStyle(
                                                color: theme.primaryColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
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
          ],
        ),
      ),
      bottomNavigationBar: InfoAbotDelivery(positions: widget.positions),
    );
  }

  void _callSetState() {
    setState(() {});
  }
}
