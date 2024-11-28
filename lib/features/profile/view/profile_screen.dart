import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/router/router.gr.dart';
import 'package:snack_time/ui/shared/widgets/base_container.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/img/user.jpg'),
                        fit: BoxFit.cover),
                    border: Border.all(
                        width: 1, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const Text('Иванов Иван'),
                const Text('+79056411232'),
              ],
            ),
          ),
          SizedBox(
            height: 190,
            child: ListView(
              padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
              scrollDirection: Axis.horizontal,
              children: [
                BaseContainer(
                  color: Theme.of(context).primaryColor,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.currency_ruble_sharp,
                            size: 60,
                            color: Colors.white,
                          ),
                          Text(
                            '350',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lora'),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'БОНУСЫ',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                BaseContainer(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(
                        image: AssetImage('assets/img/plov.jpg'),
                        height: 70,
                        width: 70,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Мои заказы',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 15,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 219, 218, 218),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: const Text(
                                '25 ЗАКАЗОВ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ),
                            onTap: () => AutoRouter.of(context)
                                .push(const OrdersListRoute()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                BaseContainer(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Профиль',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 15,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 219, 218, 218),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Text(
                          'ИЗМЕНИТЬ',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Акции',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: const Center(
              child: Text(
                'Сейчас акций нет, но это ненадолго. Заглядывайте сюда перед заказом, чтобы не упустить выгоду.',
                style: TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
