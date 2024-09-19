import 'package:snack_time/features/restaurant/view/restaurant_screen.dart';
import 'package:snack_time/features/restaurant_list/view/restaurant_list_screen.dart';

final routes = {
  ('/'): (context) => const RestaurantListScreen(),
  ('/restaurant'): (context) => const RestaurantScreen(),
};
