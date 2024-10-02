import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/repositories/repositories.dart';

part 'restaurant_list_event.dart';
part 'restaurant_list_state.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  RestaurantListBloc(
      {required this.restaurantsRepository, required this.kitchensRepository})
      : super(RestaurantListInitial()) {
    on<SearchRestaurantList>((event, emit) async {
      emit(RestaurantListLoading());

      try {
        final restaurants = await restaurantsRepository.getRestaurantsList();
        final kitchens = await kitchensRepository.getKitchensList();

        final newKitchensList = _getKitchenTitles(restaurants, kitchens);

        emit(RestaurantListLoaded(
            restaurantList: restaurants, kitchenList: newKitchensList));
      } catch (e) {
        emit(RestaurantListFailure(error: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<FilterRestaurantList>((event, emit) async {
      emit(RestaurantListLoading());

      try {
        final restaurants = await restaurantsRepository.getRestaurantsList();
        final kitchens = await kitchensRepository.getKitchensList();

        final newRestaurantsList =
            _getRestaurantListByKitchen(event.kitchenID, restaurants);
        final newKitchensList = _getKitchenTitles(restaurants, kitchens);

        emit(RestaurantListLoaded(
            restaurantList: newRestaurantsList, kitchenList: newKitchensList));
      } catch (e) {
        emit(RestaurantListFailure(error: e));
      }
    });
  }

  final RestaurantsRepository restaurantsRepository;
  final KitchensRepository kitchensRepository;

  List<Restaurant> _getRestaurantListByKitchen(
      String kitchenID, List<Restaurant> restaurants) {
    List<Restaurant> filteredList = [];

    for (var restaurant in restaurants) {
      if (restaurant.kitchen == kitchenID) {
        filteredList.add(restaurant);
      }
    }
    return filteredList;
  }

  List<Kitchen> _getKitchenTitles(
      List<Restaurant> restaurants, List<Kitchen> kitchens) {
    final List<Kitchen> newKitchensList = [];

    for (var restaurant in restaurants) {
      for (var kitchen in kitchens) {
        if (restaurant.kitchen == kitchen.id &&
            !newKitchensList.contains(kitchen)) {
          newKitchensList.add(kitchen);
        }
      }
    }

    return newKitchensList;
  }
}
