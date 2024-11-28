import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/features/registration_order.dart/provider/provider.dart';
import 'package:snack_time/ui/shared/widgets/base_textfield.dart';

class CommentTextfieldWidget extends StatelessWidget {
  const CommentTextfieldWidget({
    super.key,
    required this.model,
  });

  final Model model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 25),
            BaseTextfield(
              textController: model.commentController,
              hintText: 'Ваш комментарий...',
              height: 60,
              maxLength: 150,
              isNumber: false,
              onTap: () => model.callNotifyListeners(),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: const Center(
                  child: Text(
                    'Сохранить',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              onTap: () {
                model.commentUpdate();
                AutoRouter.of(context).maybePop();
                FocusScope.of(context).unfocus();
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
            child: const Icon(Icons.close, size: 15, color: Colors.white),
          ),
          onTap: () => AutoRouter.of(context).maybePop(),
        ),
      ],
    );
  }
}
