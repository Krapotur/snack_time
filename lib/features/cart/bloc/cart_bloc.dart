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
      // final updatedCart = List<Position>.from(state.cartPositions)
      //   ..add(event.position);

      final positions =
          _checkPositionsinCart(state.cartPositions, event.position);
      emit(CartState(cartPositions: positions));
    }
  }

  List<Position> _checkPositionsinCart(
      List<Position> positions, Position position) {
    List<Position> positionsList = positions;
    if (positionsList.isEmpty) {
      positionsList.add(position);
    } else {
      for (var x in positions) {
        if (x.id != position.id) {
          positionsList.add(position);
        } else {
          ++x.quantityInCart;
          positionsList.add(x);
        }
      }
    }

    // for (var x in positions) {
    //   if (positionsList.isEmpty) {
    //     positionsList.add(x);
    //   } else {
    //     for (var e in positionsList) {
    //       if (x.id == e.id) {
    //         ++e.quantityInCart;
    //       }
    //     }
    //   }
    // }

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
  

