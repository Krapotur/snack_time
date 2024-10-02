class Position {
  final String id;
  final bool status;
  final String title;
  final String composition;
  final int price;
  final int weight;
  final int caloric;
  final int proteins;
  final int fats;
  final int carbs;
  final String imgSrc;
  final String category;
  final String restaurant;

  const Position(
      {required this.id,
      required this.status,
      required this.title,
      required this.composition,
      required this.price,
      required this.weight,
      required this.caloric,
      required this.proteins,
      required this.fats,
      required this.carbs,
      required this.imgSrc,
      required this.category,
      required this.restaurant});
}
