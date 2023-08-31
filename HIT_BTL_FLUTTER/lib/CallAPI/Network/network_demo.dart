import 'package:dio/dio.dart';

import '../Model/category_detail.dart';

class ApiModule {
  late Dio dio;

  static const String _baseUrl = 'http://207.148.118.106:8080';

  ApiModule() {
    BaseOptions options = BaseOptions(baseUrl: _baseUrl);
    dio = Dio(options);
  }

  static Future<CategoryDetailResponse?> getDetailCategory() async {
    try {
      Response response = await ApiModule().dio.get('/combo/category/7');
      return CategoryDetailResponse.fromJson(response.data);
    } catch (error) {
      return null;
    }
  }
}