part of 'restaurant_list_bloc.dart';

class RestaurantListEvent {}

class SearchRestaurantList extends RestaurantListEvent {}

class FilterRestaurantList extends RestaurantListEvent {
  final String kitchenID;

  FilterRestaurantList({required this.kitchenID});
}
