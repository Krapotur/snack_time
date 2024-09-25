import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/models/models.dart';
import 'package:snack_time/repositories/abstract_restaurants_repository.dart';

part 'restaurant_list_event.dart';
part 'restaurant_list_state.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  RestaurantListBloc(this.restaurantsRepository)
      : super(RestaurantListInitial()) {
    on<LoadingRestaurantList>((event, emit) async {
      try {
        emit(RestaurantListLoading());
        final restaurants = await restaurantsRepository.getRestaurantsList();
        emit(RestaurantListLoaded(restaurantList: restaurants));
      } catch (e) {
        emit(RestaurantListFailure(error: e));
      }
    });
  }
  final AbstractRestaurantsRepository restaurantsRepository;
}
