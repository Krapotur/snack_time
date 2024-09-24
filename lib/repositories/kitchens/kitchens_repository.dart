import 'package:dio/dio.dart';
import 'package:snack_time/features/models/kitchen.dart';
import 'package:snack_time/features/models/models.dart';

class KitchenssRepository {
  Future<List<Kitchen>> getKitchensList() async {
    List<Kitchen> kitchentList = [];
    final response = await Dio().get('http://10.101.11.31:5000/api/kitchens');
    final dataList = response.data;

    for (var e in dataList) {
      final Kitchen kitchen =
          Kitchen(id: e['_id'], title: e['title'], imgSrc: e['imgSrc']);
      kitchentList.add(kitchen);
    }

    return kitchentList;
  }
}
