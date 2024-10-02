import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/repositories/repositories.dart';

part 'position_list_event.dart';
part 'position_list_state.dart';

class PositionListBloc extends Bloc<PositionListEvent, PositionListState> {
  PositionListBloc({
    required this.restaurantsRepository,
    required this.positionsRepository,
    required this.categoriesRepository,
  }) : super(PositionListInitial()) {
    on<SearchPositionsListEvent>((event, emit) async {
      emit(PositionListLoading());
      try {
        final positions = await positionsRepository.getPositionsList();
        final categories = await categoriesRepository.getCategoriesList();

        emit(PositionListLoaded(
            positionsList: positions, categoriesList: categories));
      } catch (e) {
        emit(PositionListFailure(error: e));
      }
    });

    on<FilterPositionsListEvent>((event, emit) async {
      emit(PositionListLoading());
      try {
        final positions = await positionsRepository.getPositionsList();
        final categories = await categoriesRepository.getCategoriesList();
        final newPositions = _getPositions(positions, event.restaurantID);

        emit(PositionListLoaded(
            positionsList: newPositions, categoriesList: categories));
      } catch (e) {
        emit(PositionListFailure(error: e));
      }
    });

    on<FilterPositionsByCategory>((event, emit) async {
      emit(PositionListLoading());
      try {
        final positions = await positionsRepository.getPositionsList(
            categoryID: event.categoryID);
        final categories = await categoriesRepository.getCategoriesList();
        final newPositions = _getPositions(positions, event.restaurantID);

        emit(PositionListLoaded(
            positionsList: newPositions, categoriesList: categories));
      } catch (e) {
        emit(PositionListFailure(error: e));
      }
    });
  }

  final RestaurantsRepository restaurantsRepository;
  final PositionsRepository positionsRepository;
  final CategoriesRepository categoriesRepository;

  List<Position> _getPositions(List<Position> positions, String restaurantID) {
    List<Position> newPositions = [];

    for (var position in positions) {
      if (position.restaurant == restaurantID) newPositions.add(position);
    }
    return newPositions;
  }
}
