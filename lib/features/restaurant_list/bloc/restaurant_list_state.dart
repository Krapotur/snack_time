part of 'restaurant_list_bloc.dart';

class RestaurantListState {}

class RestaurantListInitial extends RestaurantListState {}

class RestaurantListLoading extends RestaurantListState {}

class RestaurantListLoaded extends RestaurantListState {
  final List<Restaurant> restaurantList;

  RestaurantListLoaded({required this.restaurantList});
}

class RestaurantListFailure extends RestaurantListState {
  final Object error;

  RestaurantListFailure({required this.error});
}
