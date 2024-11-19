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
  bool isActiveKeyboard = false;
  String _comment = '';
  String _descriptionPay = '';

  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _payController = TextEditingController();
  final TextEditingController _changeFromAmountController =
      TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController promocodeController = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
            .copyWith(
                bottom: MediaQuery.of(context).viewInsets.bottom != 0 ? 100 : 0)
            .copyWith(bottom: 0),
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
            _streetController.text.isNotEmpty && _cityController.text.isNotEmpty
                ? Column(
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
                                controller: _payController,
                                menuHeight: 200,
                                menuStyle: MenuStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(Colors.white),
                                ),
                                inputDecorationTheme: InputDecorationTheme(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 220, 220, 220)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                dropdownMenuEntries: const <DropdownMenuEntry<
                                    String>>[
                                  DropdownMenuEntry(
                                      value: 'cash', label: 'Наличными'),
                                  DropdownMenuEntry(
                                      value: 'pay', label: 'По карте'),
                                ],
                                onSelected: (value) {
                                  if (value == 'pay') {
                                    _descriptionPay =
                                        '*Для оплаты картой, у курьера будет с собой банковский терминал';
                                  } else {
                                    _descriptionPay =
                                        '*Пожалуйста укажите сумму, с которой курьер должен вернуть сдачу';
                                  }
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                height:
                                    _payController.text == 'Наличными' ? 10 : 0,
                              ),
                              _payController.text == 'Наличными'
                                  ? BaseTextfield(
                                      textController:
                                          _changeFromAmountController,
                                      hintText: 'Укажите сумму',
                                      height: 45,
                                      maxLength: 6,
                                      isNumber: true,
                                      onTap: _callSetState)
                                  : const SizedBox.shrink(),
                              _descriptionPay.isNotEmpty
                                  ? Flexible(
                                      child: Text(
                                        _descriptionPay,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: theme.primaryColor),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(' Комментарий к заказу:'),
                const SizedBox(height: 3),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white),
                    child: Text(
                      _comment.isEmpty
                          ? 'добавить комментарий'
                          : _commentController.text,
                      style: TextStyle(
                          color: _commentController.text.isEmpty
                              ? theme.hintColor
                              : Colors.black87),
                    ),
                  ),
                  onTap: () => showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10)
                          .copyWith(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(1),
                            topRight: Radius.circular(1)),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 25),
                              BaseTextfield(
                                  textController: _commentController,
                                  hintText: 'Ваш комментарий...',
                                  height: 60,
                                  maxLength: 150,
                                  isNumber: false,
                                  onTap: _callSetState),
                              const SizedBox(height: 10),
                              GestureDetector(
                                child: Container(
                                  height: 35,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      'Сохранить',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    _comment = _commentController.text;
                                  });
                                  AutoRouter.of(context).maybePop();
                                },
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Icon(Icons.close,
                                  size: 15, color: Colors.white),
                            ),
                            onTap: () {
                              AutoRouter.of(context).maybePop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: Text(
                'У меня есть промокод!',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.green),
                textAlign: TextAlign.center,
              ),
              onTap: () => _showDialog(context, promocodeController),
            ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  void _showDialog(BuildContext context, TextEditingController controller) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        content: Stack(alignment: Alignment.topRight, children: [
          InputPromocode(controller: controller),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(Icons.close, size: 15, color: Colors.white),
            ),
            onTap: () {
              AutoRouter.of(context).maybePop();
            },
          ),
        ]),
      ),
    );
  }
}
