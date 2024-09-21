import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // curve: Curves.easeInCubic,
      routes: const [
        RestaurantListRoute(),
        BasketRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (index) => _openPage(index, tabsRouter),
            currentIndex: tabsRouter.activeIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.fastfood), label: 'Рестораны'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_sharp), label: 'Корзина'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_sharp), label: 'Профиль')
            ],
          ),
          // floatingActionButton: TextButton(
          //   style: ButtonStyle(
          //       backgroundColor: WidgetStatePropertyAll<Color>(
          //           Theme.of(context).primaryColor)),
          //   onPressed: () => {
          //     showModalBottomSheet(
          //       isScrollControlled: true,
          //       backgroundColor: Colors.transparent,
          //       context: context,
          //       builder: (context) => const BasketScreen(),
          //     ),
          //   },
          //   child: const Text(
          //     'Корзина',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    setState(() {});
    tabsRouter.setActiveIndex(index);
  }
}
