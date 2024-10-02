part of 'position_list_bloc.dart';

class PositionListState {}

final class PositionListInitial extends PositionListState {}

final class PositionListLoading extends PositionListState {}

final class PositionListLoaded extends PositionListState {
  final List<Position> positionsList;
  final List<Category> categoriesList;

  PositionListLoaded(
      {required this.positionsList, required this.categoriesList});
}

final class PositionListFailure extends PositionListState {
  final Object error;

  PositionListFailure({required this.error});
}
