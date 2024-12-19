import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/features/registration_order.dart/provider/provider.dart';
import 'package:snack_time/ui/shared/widgets/base_textfield.dart';

class CommentTextfieldWidget extends StatefulWidget {
  const CommentTextfieldWidget({
    super.key,
    required this.model,
  });

  final Model model;

  @override
  State<CommentTextfieldWidget> createState() => _CommentTextfieldWidgetState();
}

class _CommentTextfieldWidgetState extends State<CommentTextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: BaseTextfield(
                    textController: widget.model.commentController,
                    hintText: 'Ваш комментарий...',
                    height: 60,
                    maxLength: 150,
                    isNumber: false,
                    onTap: widget.model.callNotifyListeners,
                  ),
                ),
                widget.model.commentController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: widget.model.commentController.clear,
                      )
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: const Center(
                  child: Text(
                    'Сохранить',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              onTap: () {
                widget.model.commentUpdate();
                AutoRouter.of(context).maybePop();
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
        const Divider(
          indent: 160,
          endIndent: 160,
          thickness: 3,
        )
      ],
    );
  }
}
