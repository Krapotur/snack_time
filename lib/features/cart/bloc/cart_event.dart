part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingCartEvent extends CartEvent {}

class AddPositionCartEvent extends CartEvent {
  final Position position;

  AddPositionCartEvent({required this.position});

  @override
  List<Object> get props => [position];
}

class RemovePositionCartEvent extends CartEvent {
  final Position position;

  RemovePositionCartEvent({required this.position});
}
