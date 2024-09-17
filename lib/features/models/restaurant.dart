import 'package:snack_time/features/models/position.dart';

class Restaurant {
  final String title;
  final String kitchen;
  final double raiting;
  final String imgSrc;
  final List<Position> positions;

   Restaurant(this.title, this.kitchen, this.raiting, this.imgSrc, this.positions);
}