import 'package:snack_time/features/models/models.dart';

abstract class AbstractRestaurantsRepository {
  Future<List<Restaurant>> getRestaurantsList();
}
