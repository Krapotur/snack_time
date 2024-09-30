import 'package:dio/dio.dart';
import 'package:snack_time/repositories/kitchens/models/kitchen.dart';
import 'package:snack_time/repositories/models.dart';

class KitchensRepository {
  final Dio dio;

  KitchensRepository({required this.dio});

  Future<List<Kitchen>> getKitchensList() async {
    List<Kitchen> kitchentList = [];
    final response = await dio.get('http://10.101.11.31:5000/api/kitchens');
    final dataList = response.data;

    for (var e in dataList) {
      final Kitchen kitchen =
          Kitchen(id: e['_id'], title: e['title'], imgSrc: e['imgSrc']);
      kitchentList.add(kitchen);
    }

    return kitchentList;
  }
}
