import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/repositories/repositories.dart';

part 'position_list_bloc_state.dart';
part 'position_list_event.dart';

class PositionsListBlocBloc
    extends Bloc<PositionListEvent, PositionsListState> {
  PositionsListBlocBloc(this.restaurantsRepository, this.positionsRepository)
      : super(PositionsListInitial()) {
    on<SearchPositionsListEvent>((event, emit) async {
      emit(PositionsListLoading());
      try {
        final positions = await positionsRepository.getPositionsList();

        emit(PositionsListLoaded(positionsList: positions));
      } catch (e) {
        emit(PositionsListFailure(error: e));
      }
    });

    on<FilterPositionsListEvent>((event, emit) async {
      emit(PositionsListLoading());
      try {
        final restaurants = await restaurantsRepository.getRestaurantsList();
        final positions = await positionsRepository.getPositionsList();

        final newPositionsList = _getPositions(positions, restaurants);

        emit(PositionsListLoaded(positionsList: newPositionsList));
      } catch (e) {
        emit(PositionsListFailure(error: e));
      }
    });
  }

  final RestaurantsRepository restaurantsRepository;
  final PositionsRepository positionsRepository;

  List<Position> _getPositions(
      List<Position> positions, List<Restaurant> restaurants) {
    List<Position> newPositions = [];

    return newPositions;
  }
}
