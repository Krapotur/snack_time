part of 'restaurant_list_bloc.dart';

class RestaurantListState {}

class RestaurantListInitial extends RestaurantListState {}

class RestaurantListLoading extends RestaurantListState {}

class RestaurantListLoaded extends RestaurantListState {
  final List<Restaurant> restaurantList;
  final List<Kitchen> kitchenList;

  RestaurantListLoaded({
    required this.restaurantList,
    required this.kitchenList,
  });
}

class RestaurantListFailure extends RestaurantListState {
  final Object error;

  RestaurantListFailure({required this.error});
}
