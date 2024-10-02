part of 'position_list_bloc.dart';

class PositionListEvent {}

class SearchPositionsListEvent extends PositionListEvent {}

class FilterPositionsListEvent extends PositionListEvent {
  final String restaurantID;

  FilterPositionsListEvent({required this.restaurantID});
}

class FilterPositionsByCategory extends PositionListEvent {
  final String restaurantID;
  final String categoryID;

  FilterPositionsByCategory(
      {required this.restaurantID, required this.categoryID});
}
