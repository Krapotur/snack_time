import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/cart/bloc/cart_bloc.dart';
import 'package:snack_time/features/home/widgets/widgets.dart';
import 'package:snack_time/features/positions/bloc/position_list_bloc.dart';
import 'package:snack_time/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<PositionListBloc>(context)
        .add(SearchPositionsListEvent(null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        PositionsRoute(),
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
            selectedIconTheme: const IconThemeData(size: 25),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.fastfood,
                    size: 20,
                  ),
                  label: 'Меню'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_sharp,
                    size: 20,
                  ),
                  label: 'Профиль')
            ],
          ),
          floatingActionButton:
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return state.cartPositions.isNotEmpty
                ? FloatActionButton(positions: state.cartPositions)
                : const SizedBox();
          }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    setState(() {});
    tabsRouter.setActiveIndex(index);
  }
}
