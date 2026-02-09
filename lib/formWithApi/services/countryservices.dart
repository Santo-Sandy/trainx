import 'package:StoreLink/formWithApi/services/formdetails.dart';
import 'package:dio/dio.dart';

class CountryService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://restcountries.com/v3.1',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<List<Country>> fetchCountries() async {
    try {
      final response = await dio.get(
        '/all',
        queryParameters: {'fields': 'name'},
      );

      return (response.data as List).map((e) => Country.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception('API Error: ${e.response?.statusCode}');
    }
  }
}
