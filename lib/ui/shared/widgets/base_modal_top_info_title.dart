import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BaseModalTopInfoTitle extends StatelessWidget {
  const BaseModalTopInfoTitle(
      {super.key, required this.status, required this.title});

  final String status;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 50,
                      child: Divider(
                        height: 3,
                        thickness: 3,
                        color: Colors.black26,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                        color: _getColor(context, status),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(title,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white)),
                          Text('(${_getStatusLocalRu(status).toLowerCase()})')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
                child: IconButton(
                  onPressed: () => AutoRouter.of(context).maybePop(),
                  icon: const Icon(Icons.close, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getColor(BuildContext context, status) {
    Color color = Colors.green;

    switch (status) {
      case 'check-out':
        color = Theme.of(context).primaryColor;
      case 'notReadyByTech':
        color = Theme.of(context).primaryColor;
      case 'check-in':
        color = Colors.red;
      case 'check-out-in':
        color = Colors.red;
      case 'req-quest':
        color = const Color.fromARGB(255, 188, 188, 2);
      case 'cleaning':
        color = Colors.green;
      default:
        color = Colors.green;
    }

    return color;
  }

  String _getStatusLocalRu(String status) {
    String statusRoom = '';

    switch (status) {
      case 'check-out':
        statusRoom = 'Выезд';
      case 'notReadyByTech':
        statusRoom = 'Не готов технически';
      case 'check-in':
        statusRoom = 'Заезд';
      case 'check-out-in':
        statusRoom = 'Выезд/Заезд';
      case 'req-quest':
        statusRoom = 'Запрос гостя';
      case 'cleaning':
        statusRoom = 'Текущая уборка';
      default:
        statusRoom = 'Готов';
    }

    return statusRoom;
  }
}
