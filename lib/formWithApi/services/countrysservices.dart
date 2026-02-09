import 'package:StoreLink/formWithApi/services/countrys.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://restcountries.com/v3.1",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}

class CountrysService {
  Future<List<Countrys>> getCountries() async {
    try {
      final response = await ApiClient.dio.get(
        '/all',
        queryParameters: {'fields': 'name,idd,flags'},
      );

      final List data = response.data;

      return data
          .map((json) => Countrys.fromJson(json))
          .where((c) => c.dialCode.isNotEmpty)
          .toList();
    } on DioException catch (e) {
      throw Exception("Failed to load countries: ${e.message}");
    }
  }
}
