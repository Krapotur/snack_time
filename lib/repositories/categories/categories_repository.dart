import 'package:dio/dio.dart';
import 'package:snack_time/repositories/api_url.dart';
import 'package:snack_time/repositories/models.dart';

class CategoriesRepository {
  final Dio dio;

  CategoriesRepository({required this.dio});

  Future<List<Category>> getCategoriesList() async {
    List<Category> categoryList = [];
    final response = await dio.get('${apiUrl}api/categories');
    final dataList = response.data;

    for (var e in dataList) {
      final Category category =
          Category(id: e['_id'], title: e['title'], imgSrc: e['imgSrc']);
      categoryList.add(category);
    }
    return categoryList;
  }
}
