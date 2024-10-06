import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/repositories/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadingCartEvent>((event, emit) {
      emit(CartLoading());
    });

    on<LoadingCartEvent>((event, emit) {
      emit(CartLoading());
    });

    on<LoadingCartEvent>((event, emit) {
      emit(CartLoading());
    });
  }
}
