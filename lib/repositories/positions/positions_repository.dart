import 'package:dio/dio.dart';
import 'package:snack_time/repositories/models.dart';

class PositionsRepository {
  final Dio dio;

  PositionsRepository({required this.dio});

  Future<List<Position>> getPositionsList() async {
    List<Position> positionsList = [];
    final response = await dio.get('http://10.101.11.31:5000/api/positions');
    final dataList = response.data;

    for (var e in dataList) {
      final Position position = Position(
          id: e['_id'],
          status: e['status'],
          title: e['title'],
          composition: e['composition'],
          price: e['price'],
          weight: e['weight'],
          caloric: e['caloric'],
          proteins: e['proteins'],
          fats: e['fats'],
          carbs: e['carbs'],
          imgSrc: e['imgSrc'],
          category: e['category'],
          restaurant: e['restaurant']);
      positionsList.add(position);
    }

    return positionsList;
  }
}
