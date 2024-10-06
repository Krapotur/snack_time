part of 'cart_bloc.dart';

class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  List<Position> cart = [];
}

final class CartFailure extends CartState {}
