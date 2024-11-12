import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:snack_time/repositories/models.dart';

class PositionsRepository {
  final Dio dio;

  PositionsRepository({required this.dio});

  Future<List<Position>> getPositionsList({String categoryID = ''}) async {
    String apiUrl = dotenv.env['API_URL'] as String;
    String url = '${apiUrl}api/positions';
    List<Position> positionsList = [];

    final response = await dio
        .get(url + (categoryID.isNotEmpty ? '/category/$categoryID' : ''));
    final dataList = response.data;

    for (var e in dataList) {
      final Position position = Position(
        1,
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
      );

      positionsList.add(position);
    }

    return positionsList;
  }
}
