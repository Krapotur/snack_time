import 'package:auto_route/auto_route.dart';
import 'package:snack_time/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: HomeRoute.page, children: [
          AutoRoute(path: 'restaurantList', page: RestaurantListRoute.page),
          AutoRoute(path: 'basket', page: BasketRoute.page),
          AutoRoute(path: 'profile', page: ProfileRoute.page),
        ]),
        AutoRoute(path: '/restaurant', page: RestaurantRoute.page),
      ];
}
