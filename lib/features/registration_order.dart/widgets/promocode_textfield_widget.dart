import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/cart/models/models.dart';
import 'package:snack_time/features/registration_order.dart/provider/model.dart';

class PromocodeTextfieldWidget extends StatefulWidget {
  const PromocodeTextfieldWidget({
    super.key,
  });

  @override
  State<PromocodeTextfieldWidget> createState() =>
      _PromocodeTextfieldWidgetState();
}

class _PromocodeTextfieldWidgetState extends State<PromocodeTextfieldWidget> {
  List<Promocode> promocodeList = [
    Promocode(title: 'nice', limitUse: 2, discount: 10)
  ];
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final model = context.read<Model>();

    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Активация скидки',
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 35,
            child: TextField(
              maxLength: 20,
              autofocus: false,
              controller: model.promocodeController,
              cursorColor: theme.primaryColor,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                hintText: 'Введите промокод...',
                hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 13,
                    fontWeight: FontWeight.w200),
                fillColor: Colors.white.withAlpha(235),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      BorderSide(color: Colors.grey.shade100, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
            ),
          ),
          isError == true
              ? const Text(
                  'Недействительный промокод!',
                  style: TextStyle(fontSize: 9, color: Colors.red),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 5),
          GestureDetector(
            child: Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadiusDirectional.circular(30)),
              child: const Center(
                child: Text(
                  'Применить',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            onTap: () => _checkPromocode(model.promocodeController),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              'Не упустите выгоду!\nУкажите промокод и получите скидку до 15%.',
              style: TextStyle(color: theme.primaryColor, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  void _checkPromocode(TextEditingController controller) {
    for (var promo in promocodeList) {
      if (controller.text.toLowerCase() != promo.title.toLowerCase()) {
        setState(() {
          isError = true;
        });
      } else {
        controller.clear();
        AutoRouter.of(context).maybePop();
      }
    }
  }
}
