import 'package:dio/dio.dart';
import 'package:snack_time/features/models/models.dart';

class RestaurantsRepository {
  Future<List<Restaurant>> getRestaurantsList() async {
    List<Restaurant> restaurantList = [];
    final response =
        await Dio().get('http://10.101.11.31:5000/api/restaurants');
    final dataList = response.data;

    for (var e in dataList) {
      final Restaurant restaurant = Restaurant(
          id: e['_id'],
          status: e['status'],
          title: e['title'],
          timeOpen: e['timeOpen'],
          timeClose: e['timeClose'],
          description: e['description'],
          typePlace: e['typePlace'],
          kitchen: e['kitchen'],
          rating: e['rating'],
          imgSrc: e['imgSrc']);
      restaurantList.add(restaurant);
    }

    return restaurantList;
  }
}
