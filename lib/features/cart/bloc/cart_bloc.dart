import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/repositories/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cartPositions: [])) {
    on<CartEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
      CartEvent event, Emitter<CartState> emit) async {
    if (event is AddPositionCartEvent) {
      //   final updatedCart = List<Position>.from(state.cartPositions)
      //     ..add(event.position);

      if (state.cartPositions.isEmpty) {
        --event.position.quantityInCart;
        state.cartPositions.add(event.position);
      }
      final positions = _addPosition(state, event.position);
      emit(CartState(cartPositions: positions));
    }

    if (event is RemovePositionCartEvent) {
      final positions = _removePosition(state, event.position);
      emit(CartState(cartPositions: positions));
    }
  }

  List<Position> _addPosition(CartState state, Position position) {
    List<Position> positionsList = List<Position>.from(state.cartPositions);

    var result = positionsList.where((x) => x.id == position.id).toList();
    if (result.isNotEmpty) {
      ++result[0].quantityInCart;
    } else {
      positionsList.add(position);
    }

    return positionsList;
  }

  List<Position> _removePosition(CartState state, Position position) {
    List<Position> positionsList = List<Position>.from(state.cartPositions);

    var result = positionsList.where((x) => x.id == position.id).toList();

    if (result.isNotEmpty && result[0].quantityInCart > 0) {
      --result[0].quantityInCart;
      if (result[0].quantityInCart == 0) {
        positionsList = List<Position>.from(state.cartPositions);
        positionsList.remove(position);
      }
    }

    return positionsList;
  }
}

    // on<LoadingCartEvent>((event, emit) {
    //   emit(CartLoading());
    //   emit(CartLoaded());
    // });

    // on<LoadingCartEvent>((event, emit) {
    //   emit(CartLoading());
    // });
  

