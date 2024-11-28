import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/cart/widgets/widgets.dart';
import 'package:snack_time/features/registration_order.dart/provider/model.dart';

class PromocodeWidget extends StatelessWidget {
  const PromocodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      onTap: () => _showDialogForPromocode(context),
    );
  }
}

void _showDialogForPromocode(BuildContext context) {
  final theme = Theme.of(context);
  showDialog(
    context: context,
    builder: (context) => ChangeNotifierProvider(
      create: (context) => Model(),
      child: AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        content: Stack(alignment: Alignment.topRight, children: [
          const PromocodeTextfieldWidget(),
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
    ),
  );
}
