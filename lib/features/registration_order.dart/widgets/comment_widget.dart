import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_time/features/registration_order.dart/provider/model.dart';
import 'package:snack_time/features/registration_order.dart/widgets/widgets.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<Model>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(' Комментарий к заказу:'),
        const SizedBox(height: 3),
        GestureDetector(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Text(
              model.comment.isEmpty ? 'добавить комментарий' : model.comment,
              style: TextStyle(
                  color: model.commentController.text.isEmpty
                      ? Theme.of(context).hintColor
                      : Colors.black87),
            ),
          ),
          onTap: () => _showDialogForComment(context, model),
        ),
      ],
    );
  }
}

void _showDialogForComment(BuildContext context, Model model) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => ChangeNotifierProvider(
      create: (context) => model,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(1), topRight: Radius.circular(1)),
        ),
        child: CommentTextfieldWidget(model: model),
      ),
    ),
  );
}
