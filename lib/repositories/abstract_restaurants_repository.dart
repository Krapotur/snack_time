import 'package:snack_time/repositories/models.dart';

abstract class AbstractRestaurantsRepository {
  Future<List<Restaurant>> getRestaurantsList();
}
