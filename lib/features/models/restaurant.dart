class Restaurant {
  String? id;
  bool? status;
  String title;
  String description;
  double rating;
  String typePlace;
  String kitchen;
  String imgSrc;
  String timeOpen;
  String timeClose;

  Restaurant({
    required this.id,
    required this.status,
    required this.title,
    required this.description,
    required this.rating,
    required this.typePlace,
    required this.kitchen,
    required this.imgSrc,
    required this.timeOpen,
    required this.timeClose,
  });
}
