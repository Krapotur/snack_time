part of 'position_list_bloc.dart';

class PositionListEvent {}

class SearchPositionsListEvent extends PositionListEvent {
  Completer? completer;

  SearchPositionsListEvent(this.completer);
}

class FilterPositionsListEvent extends PositionListEvent {
  final String restaurantID;

  FilterPositionsListEvent({required this.restaurantID});
}

class FilterPositionsByCategory extends PositionListEvent {
  final String categoryID;

  FilterPositionsByCategory({required this.categoryID});
}
