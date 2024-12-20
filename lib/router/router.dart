import 'package:auto_route/auto_route.dart';
import 'package:snack_time/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: HomeRoute.page, children: [
          AutoRoute(path: 'positions', page: PositionsRoute.page),
          AutoRoute(path: 'profile', page: ProfileRoute.page),
        ]),
        AutoRoute(path: '/cart', page: CartRoute.page),
        AutoRoute(
            path: '/registration-order', page: RegistrationOrderRoute.page),
        AutoRoute(path: '/order-list', page: OrdersListRoute.page),
      ];
}
