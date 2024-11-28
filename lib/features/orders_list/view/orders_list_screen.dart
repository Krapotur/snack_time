import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrdersListScreen extends StatefulWidget {
  const OrdersListScreen({super.key});

  @override
  State<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Мои заказы(5)',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: ListView.separated(
        itemCount: 5,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (contex, i) => const SizedBox(height: 10),
        itemBuilder: (context, i) => Container(
          padding: const EdgeInsets.all(20).copyWith(bottom: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 1,
                color: theme.primaryColor,
              ),
              right: BorderSide(
                width: 1,
                color: theme.primaryColor,
              ),
            ),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 213, 213, 213),
                  blurRadius: 3,
                  spreadRadius: 0.5,
                  offset: Offset(1, 0)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '№ 123',
                    style: TextStyle(color: theme.hintColor),
                  ),
                  Text(
                    'Статус: Завершен',
                    style: TextStyle(color: theme.hintColor),
                  ),
                ],
              ),
              const Text(
                '28.11.2024, 15:30',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              const Divider(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Адрес',
                    style: TextStyle(color: theme.hintColor),
                  ),
                  const Flexible(
                    child: Text(
                      'Боровск, ул. Ленина, дом 5',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  )
                ],
              ),
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Сумма'),
                  Text(
                    '1450 руб',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  SizedBox()
                ],
              ),
              const Divider(),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Подробнее',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: theme.primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
