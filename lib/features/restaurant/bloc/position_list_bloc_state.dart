part of 'position_list_bloc.dart';

class PositionsListState {}

final class PositionsListInitial extends PositionsListState {}

final class PositionsListLoading extends PositionsListState {}

final class PositionsListLoaded extends PositionsListState {
  final List<Position>? positionsList;

  PositionsListLoaded({required this.positionsList});
}

final class PositionsListFailure extends PositionsListState {
  final Object error;

  PositionsListFailure({required this.error});
}
