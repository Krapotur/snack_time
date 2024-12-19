import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/repositories/repositories.dart';

part 'position_list_event.dart';
part 'position_list_state.dart';

class PositionListBloc extends Bloc<PositionListEvent, PositionListState> {
  PositionListBloc({
    required this.positionsRepository,
    required this.categoriesRepository,
  }) : super(PositionListInitial()) {
    on<SearchPositionsListEvent>((event, emit) async {
      emit(PositionListLoading());
      try {
        final categories = await categoriesRepository.getCategoriesList();
        final positions = await positionsRepository.getPositionsList(
            categoryID: categories[0].id);

        emit(PositionListLoaded(
            positionsList: positions, categoriesList: categories));
      } catch (e) {
        emit(PositionListFailure(error: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<FilterPositionsListEvent>((event, emit) async {
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

    on<FilterPositionsByCategory>((event, emit) async {
      emit(PositionListLoading());
      try {
        final positions = await positionsRepository.getPositionsList(
            categoryID: event.categoryID);
        final categories = await categoriesRepository.getCategoriesList();

        emit(PositionListLoaded(
            positionsList: positions, categoriesList: categories));
      } catch (e) {
        emit(PositionListFailure(error: e));
      }
    });
  }

  final PositionsRepository positionsRepository;
  final CategoriesRepository categoriesRepository;
}
